# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.67"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.67/berth-darwin-arm64", using: :nounzip
      sha256 "f8da2558b6b4cc1f26af9c876c0f53bf5d9e1abd2cf228ffc35341c6f254f17e"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.67/berth-darwin-amd64", using: :nounzip
      sha256 "ed63016e84d522a849050336ffe55bfe79a0e23bb043237c6e5b104c5dcc3cf6"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.67/berth-linux-arm64", using: :nounzip
      sha256 "5e7f07c3f423b23cfb84d93bb2efeb099d741ee121e83edf53cd64d54791b2cb"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.67/berth-linux-amd64", using: :nounzip
      sha256 "96e5b36a5379bc8a696cbeea0a66dd927e1061be1986d2fb2a421f4e15c82d2d"
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
