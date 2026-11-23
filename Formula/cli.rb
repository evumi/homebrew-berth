# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.37"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.37/berth-darwin-arm64", using: :nounzip
      sha256 "ba1cb4d964b1848dd256681c2f31735c698a9991b54ae513c724944577a3f5e4"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.37/berth-darwin-amd64", using: :nounzip
      sha256 "90d2df32dc9fbb282fd358d67e51f4e86888be83b26b32cb00eba95010fbb6e2"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.37/berth-linux-arm64", using: :nounzip
      sha256 "3df5d56e1bf98b38915c2398f4efff64de65b749e5efed59eae5919bf92f75c4"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.37/berth-linux-amd64", using: :nounzip
      sha256 "f2409440b23ae73206426d1a65ec111cd865b9ee21e792cd398d5dcc36c53c4f"
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
