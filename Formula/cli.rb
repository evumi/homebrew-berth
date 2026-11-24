# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.2.1/berth-darwin-arm64", using: :nounzip
      sha256 "3b9e3e28a631fe70a196dfa37cd810bf2119186c2feef3c2123f191add323fae"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.2.1/berth-darwin-amd64", using: :nounzip
      sha256 "bfa0027916c58f6e3cdb311d1ec594aeff4eafd92a7672efbcadd4dfb2d1b770"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.2.1/berth-linux-arm64", using: :nounzip
      sha256 "607062a0e46f4bda7fcc3c4a7bb4e5c38d4039da9209d9164d4ec0c5419ddfe4"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.2.1/berth-linux-amd64", using: :nounzip
      sha256 "1161fd3076e49a43956085dc04a43b7e93a172c8341799d9989cb8999d1ae8ac"
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
