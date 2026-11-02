# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.55"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.55/berth-darwin-arm64", using: :nounzip
      sha256 "513992f97c70004d26679d689f9cdc9c2fe169e8a60d4ed6add8302eef53af78"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.55/berth-darwin-amd64", using: :nounzip
      sha256 "341cfa53ebf5d84e37e9339a583dd87168538a3f58e5f7ebe4cc30cb2ade0252"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.55/berth-linux-arm64", using: :nounzip
      sha256 "366f8de796f32af4be9975d3cf5f51082d126dc33adabfeba5f63e90ceba6a48"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.55/berth-linux-amd64", using: :nounzip
      sha256 "03e270f913d5ea99846a93bfc673fa29874dda0c0c00d14a1be14efe42ce8359"
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
