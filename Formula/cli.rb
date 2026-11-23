# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.2.0/berth-darwin-arm64", using: :nounzip
      sha256 "e73abaff5222ddf16557557e43d749c2c46261c729d808f36917956619aee3ea"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.2.0/berth-darwin-amd64", using: :nounzip
      sha256 "79b730f931030ae4fe74e744567bea6fc1cb1cc3b09988c7ae2b86ebf4b00fa1"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.2.0/berth-linux-arm64", using: :nounzip
      sha256 "d5f64012d20a61e5153d385cb0020da0cf2272bf86c4946bf94d97ad9d6f8fb7"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.2.0/berth-linux-amd64", using: :nounzip
      sha256 "e9d94377ce032f771b561bb774030b764fb92a77ec188a2760d478e748646f2b"
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
