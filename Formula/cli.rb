# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.2.2/berth-darwin-arm64", using: :nounzip
      sha256 "53cdabc0bf3bbe17048b4f3caabce5411eaacf960722960ba07391ad9ef40beb"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.2.2/berth-darwin-amd64", using: :nounzip
      sha256 "54c3c6128ea374c62bd876c67536d038482c28c5fe25d315f8d087b25b741475"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.2.2/berth-linux-arm64", using: :nounzip
      sha256 "54b49f913f5bf95473d39e5b21f348b39d5f5a3741abfca996d8f0d062c5035c"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.2.2/berth-linux-amd64", using: :nounzip
      sha256 "b0209c230f4b8f121eb696b3e500cc3161ed6214c4b6ae2dbe702067c1bfe28c"
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
