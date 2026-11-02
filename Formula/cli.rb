# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.63"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.63/berth-darwin-arm64", using: :nounzip
      sha256 "f64058b8d8047019a7319b7fcf5ee437e1959f644580149befe2271a693aa178"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.63/berth-darwin-amd64", using: :nounzip
      sha256 "48b3173d03e286b9e7b2bfc748cdbff48fbcc2fa1889c3ed10b4f8cf1702e93d"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.63/berth-linux-arm64", using: :nounzip
      sha256 "9ae6924eb3ac38314f53f9543264bd3d2525530ef8447349f8745372a36fbd68"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.63/berth-linux-amd64", using: :nounzip
      sha256 "487032d7f93a46d192490a0bf98171f0feac8c432d1319102bbcb5fdc805a697"
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
