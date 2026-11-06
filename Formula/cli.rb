# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.6/berth-darwin-arm64", using: :nounzip
      sha256 "3ab6675d4841915428951c0a4766924e6e312127558a8be00e7adf2cc0c0cbfb"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.6/berth-darwin-amd64", using: :nounzip
      sha256 "f2110ca96ade36686acdc68aa347d22bd01af24f33e88998ee0e288ec801128f"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.6/berth-linux-arm64", using: :nounzip
      sha256 "0dfe33fd1c1a20a8a673071014036bbcc0815d89b56dd02081e1a30b55b107a9"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.6/berth-linux-amd64", using: :nounzip
      sha256 "a19d045b2435878533df39a2f264eb2d7dd5afcb4c5be1e6f0d64d6455668d5a"
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
