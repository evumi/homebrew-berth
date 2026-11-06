# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.4/berth-darwin-arm64", using: :nounzip
      sha256 "5548129ca13903579b305b996a9f1378e0c5a47fb29bbac20ffb9aebf7e854b6"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.4/berth-darwin-amd64", using: :nounzip
      sha256 "efb386e9efe7faf6ec025da4ebce43dacdb645af8f3f7c816b639064d6b7dca1"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.4/berth-linux-arm64", using: :nounzip
      sha256 "fdf085a13ada284a5927d59687484c5e757d105309b8906e8efb16f973738b85"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.4/berth-linux-amd64", using: :nounzip
      sha256 "91553cfa18f416a0fdc8837dd4f8ab76320a63d694eb5c2b092a87a60f79bd9f"
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
