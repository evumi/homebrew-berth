# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.10/berth-darwin-arm64", using: :nounzip
      sha256 "72fd11c9e946a768c7f119c22d336d4dabdd92518c743302aa53ddfc724b347f"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.10/berth-darwin-amd64", using: :nounzip
      sha256 "3affc243fa7027d9440efd3a60363fa16933c7a711c6e005b9711960ac8c3c94"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.10/berth-linux-arm64", using: :nounzip
      sha256 "2bc5aeaf6cfbabd7e4b880b7ecc4a0813ff248cc95841a386f538c7357c9b862"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.10/berth-linux-amd64", using: :nounzip
      sha256 "a58b40fc8370cfd75ba0bf7a689d374e6b19937ade92b05a57e3f54eeefbbbfd"
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
