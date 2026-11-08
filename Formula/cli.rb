# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.9/berth-darwin-arm64", using: :nounzip
      sha256 "bfc919104a4395f812a44c016689e3def49591f33390eeb1eb3e50a357f88673"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.9/berth-darwin-amd64", using: :nounzip
      sha256 "a15fb0322e49f2c949e9ef1ae9daa01bc8c4b8df43b4365613e1e71ee6ce68d8"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.9/berth-linux-arm64", using: :nounzip
      sha256 "5bff167a1f4f46d9d61ae3feb9f1d2241c034d6de62082bcfa60a9175e567bda"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.9/berth-linux-amd64", using: :nounzip
      sha256 "6871122ddf1e9da07ba0deeb4e8f433772b6e53d1ebe931da67674ffb93c70e5"
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
