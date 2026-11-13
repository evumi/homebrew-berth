# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.25"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.25/berth-darwin-arm64", using: :nounzip
      sha256 "74b7e55b66e9cd493c4c7854d25c2a74ff115620b1c850c81bc5557fae462832"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.25/berth-darwin-amd64", using: :nounzip
      sha256 "dd53ad6b1db56d0f43e27d0ff94f9f7ba4ceb60de80aaa2d1c96e934df8a2302"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.25/berth-linux-arm64", using: :nounzip
      sha256 "92e25e410dadec5f29dafe56a78a5ec87a351f6eb693ae58440647d2eb6b6c09"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.25/berth-linux-amd64", using: :nounzip
      sha256 "cd733892cbebfd40a912fdce6310ea632d91cfafc92e3b5ffa96e93a701e7b81"
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
