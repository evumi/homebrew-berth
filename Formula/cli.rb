# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.13/berth-darwin-arm64", using: :nounzip
      sha256 "77ce8f2c0529d94ae2e4bbcbc640ff52695a6d763222b6f3c24e5547bf0660dc"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.13/berth-darwin-amd64", using: :nounzip
      sha256 "4ec2521ce4c8c5a18ca5a38e850c51cbd5f292e7f9d1323172be39d0041801df"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.13/berth-linux-arm64", using: :nounzip
      sha256 "f65e23c36ae9fc25453a466033c524e39ad9459eb4bf0f80dda38ae4805d863f"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.13/berth-linux-amd64", using: :nounzip
      sha256 "5f201d0cde132f38b20256f1f9640460b399b3a36bbd098ff982658e26e9f665"
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
