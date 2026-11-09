# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.16/berth-darwin-arm64", using: :nounzip
      sha256 "96c91170df2c9d28bb1e5b457eb35a97909dc16978a1e9fb695eea1250b9a60f"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.16/berth-darwin-amd64", using: :nounzip
      sha256 "6d485df75123cbaa0bc4b1c1669eed5e6a43086f3408ee4df2ccc7137965b3c9"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.16/berth-linux-arm64", using: :nounzip
      sha256 "e993aa6c5fdf1395efc8787fc5ecca791cff9dd829884a77b74c072056a5119e"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.16/berth-linux-amd64", using: :nounzip
      sha256 "0de92330731f65c667e0c528773c89bb771c421050220187021a5e490b0c0e03"
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
