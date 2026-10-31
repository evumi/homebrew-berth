# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.37"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.37/berth-darwin-arm64", using: :nounzip
      sha256 "f2173e63d84862dc3dcfed086c41571ab9a57393e6641c19b268610dae538022"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.37/berth-darwin-amd64", using: :nounzip
      sha256 "6ba7d7325ff595e837921213c1fedffec2056f15215aa635dbfccb057ed77aa6"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.37/berth-linux-arm64", using: :nounzip
      sha256 "8297d7052c204bac5cb29515de47dd3b79cf62fcba7aa1523476bdb3bc0bcd66"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.37/berth-linux-amd64", using: :nounzip
      sha256 "3d123c0a695fd481f080d911a3863cff56cf47092926e4ed6e3722d2f631117e"
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
