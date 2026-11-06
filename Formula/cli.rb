# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.72"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.72/berth-darwin-arm64", using: :nounzip
      sha256 "5e22ef08e5aba551351d6b9587511a7d3b28b23035634809666a1e9797d3e70c"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.72/berth-darwin-amd64", using: :nounzip
      sha256 "207116aab08362a34d3f122539afa59435fb9f2abd4aa76949d85c2a724579fe"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.72/berth-linux-arm64", using: :nounzip
      sha256 "8df27b2122a24e7b0f854097ca9f344ca65f61a1a8712a87fdca03a4fc974ac6"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.72/berth-linux-amd64", using: :nounzip
      sha256 "7bf4eece92b54cad1fa04ef0814cfb409a1e59992750a9eb71c3a4d936cf4699"
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
