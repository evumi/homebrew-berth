# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.38"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.38/berth-darwin-arm64", using: :nounzip
      sha256 "022e922b4e22289230f9816dc3b261d24a0336a5dd6a62a9986c7c99bbfdd89d"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.38/berth-darwin-amd64", using: :nounzip
      sha256 "50066f8c3003e3d2713935c6f0d7a8ced2d8b42ec3d930533880327adb3b4495"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.38/berth-linux-arm64", using: :nounzip
      sha256 "1e2b5e0e994f123228c1e1ff1e54fe71101cd6706fead674b0807e770320c4c9"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.38/berth-linux-amd64", using: :nounzip
      sha256 "50df7cd04642636d4175a41f04675802f654290d31f905a7e49d1ed75d00097d"
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
