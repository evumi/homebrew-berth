# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.7/berth-darwin-arm64", using: :nounzip
      sha256 "2ceb574617fc51ae78229c46f4acffdd0f19beb9e22fb84a9ac4a1939030e46a"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.7/berth-darwin-amd64", using: :nounzip
      sha256 "7865a5dc758d274fff4e8267fd17183445c3755685bbcc71bb1a172de6f71d6a"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.7/berth-linux-arm64", using: :nounzip
      sha256 "fa7804d7d34886592ed78b2debdc97db5d0e5bfda5244c085e2c6b98f7d8ce94"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.7/berth-linux-amd64", using: :nounzip
      sha256 "8d79f80ff2926ad3af4a326d1a0361b6a9c30d2d6415a2a7fbc7ef4bf9cc01ee"
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
