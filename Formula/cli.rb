# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.71"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.71/berth-darwin-arm64", using: :nounzip
      sha256 "7cfcda2982d05a11c994eb4523648f8d1cce3236cadbd977b3334be97286bc4c"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.71/berth-darwin-amd64", using: :nounzip
      sha256 "24aea24fd09c524ae70c9c507ac8b13a97166fec44906257460b0ebd7ed209f0"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.71/berth-linux-arm64", using: :nounzip
      sha256 "b616d0c2c2cbb12c1f3d39adf1d4d6afc30e291fbcfca8b8a0b2b173a951a45a"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.71/berth-linux-amd64", using: :nounzip
      sha256 "d7d1a6bad4e87f9f3a66fd6d785213839511003baf45465f62f9f98722d5ca1a"
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
