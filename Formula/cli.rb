# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.2.4/berth-darwin-arm64", using: :nounzip
      sha256 "4ab5afb87de1633e89fcfb3e6ee94b0ee7db5138fd48af4a668e59a03652ab2e"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.2.4/berth-darwin-amd64", using: :nounzip
      sha256 "f68347652986b4142c4e1ef8c3d1e366e1cdf690d924cd1977d09cd8dd2a1482"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.2.4/berth-linux-arm64", using: :nounzip
      sha256 "221c35591919ab158583063dc325eaf08535e067d66920f291fd18ccd27953f8"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.2.4/berth-linux-amd64", using: :nounzip
      sha256 "5d0a38863f8fdb45833ae5e581a931a8adb2871c26103c9dece95ea518da939b"
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
