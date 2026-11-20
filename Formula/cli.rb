# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.31"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.31/berth-darwin-arm64", using: :nounzip
      sha256 "217201d0c59b2c0eac8e5f8a99ba8d566263ee2a0a61d72d02b21a7501d65881"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.31/berth-darwin-amd64", using: :nounzip
      sha256 "967d957acefa3d06e1a88514d61be22877c73020841e8c8db4641df327551a58"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.31/berth-linux-arm64", using: :nounzip
      sha256 "a2444099a51779f638045af02336f036f94b5e1fe04cb6984f0df711499b29ac"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.31/berth-linux-amd64", using: :nounzip
      sha256 "177d7805e48edfcf699db8e03ff614e5e25aa0d585c697b7cf53a98da10c827a"
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
