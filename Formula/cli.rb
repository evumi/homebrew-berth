# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.8/berth-darwin-arm64", using: :nounzip
      sha256 "09aafd51794d3617f83785219e17e633603d0cd7da117fab268bcf0022ac968f"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.8/berth-darwin-amd64", using: :nounzip
      sha256 "0154f4c38dcecbd76102f53e6f93bdb62b9f3cdbb0d04124c3887a911d1c4d0d"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.8/berth-linux-arm64", using: :nounzip
      sha256 "7d5a54dad6e009d58d12c79c6d0e8c9afb30cb71e115405885f5335b82e4b6d9"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.8/berth-linux-amd64", using: :nounzip
      sha256 "fc3ddb794cd4e98b6e59f324792e25cbc522a8f7934a1ee3b4fb0b2a26f4aafc"
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
