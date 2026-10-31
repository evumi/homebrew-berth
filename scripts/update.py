#!/usr/bin/env python3
"""Generate the public CLI formula only from a signed, fully downloadable R2 release."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile
import urllib.request
from urllib.parse import urlsplit

ROOT = 'https://releases.bunship.site/berth'
PUBLIC_KEY = 'RWSOvdkU1aPNoMMiHBmB3ukc7m7vwfpU3V0iROFdY+jbfq7Gzku/kbkK'
PLATFORMS = ('darwin-arm64', 'darwin-amd64', 'linux-arm64', 'linux-amd64')

class SameOrigin(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        u = urlsplit(newurl)
        if u.scheme != 'https' or u.netloc != urlsplit(ROOT).netloc:
            raise ValueError('Refusing release redirect')
        return super().redirect_request(req, fp, code, msg, headers, newurl)


def fetch(path, limit):
    req = urllib.request.Request(ROOT + '/' + path, headers={'User-Agent': 'berth-homebrew-publisher'})
    with urllib.request.build_opener(SameOrigin).open(req, timeout=120) as r:
        b = r.read(limit + 1)
    if len(b) > limit:
        raise ValueError('Release file exceeds size limit')
    return b


def render(tag, sums):
    if not re.fullmatch(r'v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)', tag):
        raise ValueError('Homebrew requires a stable release tag')
    hashes = {}
    for line in sums.decode().splitlines():
        m = re.fullmatch(r'([0-9a-f]{64}) [ *]([A-Za-z0-9._-]+)', line)
        if not m or m[2] in hashes:
            raise ValueError('Invalid or duplicate checksum entry')
        hashes[m[2]] = m[1]
    lines = ['# Generated from a minisign-verified Berth release; do not edit.',
             'class Cli < Formula', '  desc "Command-line client for the Berth self-hosted PaaS"',
             '  homepage "https://github.com/evumi/homebrew-berth"', f'  version "{tag[1:]}"', '']
    for system, platform in [('macos', 'darwin'), ('linux', 'linux')]:
        lines.append(f'  on_{system} do')
        for cpu, arch in [('arm', 'arm64'), ('intel', 'amd64')]:
            name = f'berth-{platform}-{arch}'
            lines.extend([f'    on_{cpu} do', f'      url "{ROOT}/{tag}/{name}", using: :nounzip',
                          f'      sha256 "{hashes[name]}"', '    end'])
        lines.extend(['  end', ''])
    lines.extend(['  def install', '    platform = OS.mac? ? "darwin" : "linux"',
                  '    arch = Hardware::CPU.arm? ? "arm64" : "amd64"',
                  '    bin.install "berth-#{platform}-#{arch}" => "berth"', '  end', '',
                  '  test do', '    assert_match version.to_s, shell_output("#{bin}/berth version")', '  end', 'end', ''])
    return '\n'.join(lines), hashes


def update(output):
    manifest = json.loads(fetch('latest.json', 1 << 20))
    tag = manifest.get('tag_name', '')
    if manifest.get('schema') != 1 or manifest.get('prerelease') is not False or not re.fullmatch(r'v\d+\.\d+\.\d+', tag):
        raise ValueError('Invalid stable manifest')
    if output.exists():
        old = re.search(r'^  version "(\d+\.\d+\.\d+)"$', output.read_text(), re.M)
        if old and tuple(map(int, old[1].split('.'))) >= tuple(map(int, tag[1:].split('.'))):
            print('Homebrew is already current:', old[1])
            return
    sums = fetch(tag + '/SHA256SUMS', 1 << 20)
    sig = fetch(tag + '/SHA256SUMS.minisig', 64 << 10)
    with tempfile.TemporaryDirectory() as d:
        p = Path(d) / 'SHA256SUMS'
        p.write_bytes(sums)
        Path(str(p) + '.minisig').write_bytes(sig)
        subprocess.run(['minisign', '-Vm', str(p), '-P', PUBLIC_KEY], check=True, capture_output=True)
    if f'trusted comment: berth {tag} SHA256SUMS' not in sig.decode().splitlines():
        raise ValueError('Signed release tag does not match manifest')
    formula, hashes = render(tag, sums)
    for platform in PLATFORMS:
        name = 'berth-' + platform
        if hashlib.sha256(fetch(tag + '/' + name, 256 << 20)).hexdigest() != hashes[name]:
            raise ValueError('Public binary does not match signed checksum: ' + name)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(formula)
    print('Updated Homebrew formula:', tag)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, default=Path('Formula/cli.rb'))
    update(parser.parse_args().output)
