# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.19"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.19/berth-darwin-arm64", using: :nounzip
      sha256 "a7e9f5f2653e0e353a38d760d22d9100ee134a68f9d327d4183f7c5628f03473"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.19/berth-darwin-amd64", using: :nounzip
      sha256 "061c499debf736c97d2b559e511144d42c8af17f39fba1d2bd4d784fcb6607d4"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.19/berth-linux-arm64", using: :nounzip
      sha256 "b286f670a8d0ded8c48c54f261732961b97fd151ff582c4db9a0c2c4d334453e"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.19/berth-linux-amd64", using: :nounzip
      sha256 "baf240b624b820b0167b36b1c434a83577706a15fecb4dcf6f65c330c6cdb225"
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
