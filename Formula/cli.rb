# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.17/berth-darwin-arm64", using: :nounzip
      sha256 "0e46610cf9c4aa486c7e09f4bc5c0661fd3e68f95c69c1c0b2c1647d66dcfa02"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.17/berth-darwin-amd64", using: :nounzip
      sha256 "d2385d9c8eb24298fd0607dcaf7722c0208c964dfb089aa76e65147289dcd8e7"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.17/berth-linux-arm64", using: :nounzip
      sha256 "2aff4c5ac2756e8b1ac442cc8866a732e3158c0f274470645f72e3c6cce698cf"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.17/berth-linux-amd64", using: :nounzip
      sha256 "646a06959e792e67abeff480569c9aa766db77f087caae578a51fb3c6c0f710f"
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
