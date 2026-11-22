# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.36"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.36/berth-darwin-arm64", using: :nounzip
      sha256 "e81c8ba5740f2b3eb807fa6434ff3bf80b0dafa923fee64c74d46a4cddef11ae"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.36/berth-darwin-amd64", using: :nounzip
      sha256 "23a6ae0ebca1da6d91b69308f0fff897eb6227efa752a50809769b1e3e517f7e"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.36/berth-linux-arm64", using: :nounzip
      sha256 "2d8c4bd007939a235fa3dc656b589135a76845d14f121332a7e1e9464b73c29d"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.36/berth-linux-amd64", using: :nounzip
      sha256 "921e4320e6e1666e0d8ff86ceff395718fdbc4ea2e4bd8be75fc9cae1c16870b"
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
