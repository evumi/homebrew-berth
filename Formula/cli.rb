# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.34"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.34/berth-darwin-arm64", using: :nounzip
      sha256 "f6729bbacc848ba92c2025abe812757001b4133e6cbc00231e1b9e3a5ee3a9c8"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.34/berth-darwin-amd64", using: :nounzip
      sha256 "784027ecedc0e9b2bd28599eb082c7cf7df07162b5238799b07dc186638910fa"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.34/berth-linux-arm64", using: :nounzip
      sha256 "d47e6c825fee93d5a5956bc56e825e2558608ddbaabae2e63fef49870c13d30e"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.34/berth-linux-amd64", using: :nounzip
      sha256 "d302d232dd23000857a3b8bba25c990e6624911115471ecdb2aacb7061e7680f"
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
