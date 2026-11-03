# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.66"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.66/berth-darwin-arm64", using: :nounzip
      sha256 "38a5d3eef3abcebd2698286f59c8272b45ea6cbfb8cd0914321ca37c3931c266"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.66/berth-darwin-amd64", using: :nounzip
      sha256 "eb571d46fe01835b3abe102912b93b0ed136d85d175bf2eff4128a6289acac92"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.66/berth-linux-arm64", using: :nounzip
      sha256 "a663262a43c63aa0eb2355dfb25761d84201d0c5f869295f0f1df9c8d1a7d1cc"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.66/berth-linux-amd64", using: :nounzip
      sha256 "0cb5508aa22319bfc9c478137742d726f0adb85eeb05d0075eabf996e1ce8310"
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
