# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.12/berth-darwin-arm64", using: :nounzip
      sha256 "84ffdfa1a3986075b42373eacb620793212de0d9773010acdc74be00b7b9ab24"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.12/berth-darwin-amd64", using: :nounzip
      sha256 "e45c85481e4cd34411a64b894c1859f869e2f1b9cdecba22e5169d70a39a67d1"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.12/berth-linux-arm64", using: :nounzip
      sha256 "1f995215a8e545f42a855c5d41971fc28983a5185ead4e504bdf43b83660a35b"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.12/berth-linux-amd64", using: :nounzip
      sha256 "f50b67722cf044526af0610f76c3187439518f934938eebcc561378cab4153e6"
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
