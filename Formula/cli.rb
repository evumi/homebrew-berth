# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.58"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.58/berth-darwin-arm64", using: :nounzip
      sha256 "25dbb1e7e3acb974dd93825c394fd2bea74b0fe98bac6c32f3ad2e0949b7bfbc"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.58/berth-darwin-amd64", using: :nounzip
      sha256 "666886846f881558bf4420ed433acb7927d4733a34b714216b68afeeff467778"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.58/berth-linux-arm64", using: :nounzip
      sha256 "637311881ce6f19da23a815c7a76fc561121b7f76919685e7f682098347af377"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.58/berth-linux-amd64", using: :nounzip
      sha256 "ff362c656f8cdfa1c62bf00932b8966de21d487cc5ce6d7cbbe40d3771307530"
    end
  end

  def install
    platform = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "berth-#{platform}-#{arch}" => "berth"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/berth version")
  end
end
