# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.18/berth-darwin-arm64", using: :nounzip
      sha256 "90a9199e7c10f052795dd4e539e4777a9eae705e643305e79f7638ea0c265523"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.18/berth-darwin-amd64", using: :nounzip
      sha256 "08277e38a4f918c13168c57e154c8a55751d766c29eca178075111924e5ea83b"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.18/berth-linux-arm64", using: :nounzip
      sha256 "bbce8c3684df3fd6dca1cf6d8e2f543c178d4f83049bce028d487aa2f2428ee7"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.18/berth-linux-amd64", using: :nounzip
      sha256 "183d29c5052109777a7a34bde2ddcf1558e659d120f6e2c84c253da4780d4c4d"
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
