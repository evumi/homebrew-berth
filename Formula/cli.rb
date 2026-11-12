# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.23"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.23/berth-darwin-arm64", using: :nounzip
      sha256 "07c3a431aa5270f646ef298c27826d0241836c15a8eedaa354c45e37a9cec3fe"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.23/berth-darwin-amd64", using: :nounzip
      sha256 "d496a95fcc7ecfd9f00e304b81cae44d54e02374c52fa072730c4d20decbe33a"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.23/berth-linux-arm64", using: :nounzip
      sha256 "e96c5dda2463780e0ca388be5c65445f5421151d810399d4fd9a20bd629290d1"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.23/berth-linux-amd64", using: :nounzip
      sha256 "449711e3505f1fbca9402eb56977bd41d6df6d779fac8c5314407139aee93812"
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
