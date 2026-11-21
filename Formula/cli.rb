# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.35"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.35/berth-darwin-arm64", using: :nounzip
      sha256 "3e92fc6ca18d81fb6c79a601346641067804552a30803b5686ec13f1da99038e"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.35/berth-darwin-amd64", using: :nounzip
      sha256 "20657e5385ebb4d3cb464dadee615056ea081a88c34b23edb82ba1d08522471b"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.35/berth-linux-arm64", using: :nounzip
      sha256 "a7dd823f4b0935e2bd7253aa9e4d51290a26aff7022901d690c210f4a763658c"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.35/berth-linux-amd64", using: :nounzip
      sha256 "1b34051d47a864666a1d446414aa1caa5a3bc3eae19da05b47a9fca74a59f8e0"
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
