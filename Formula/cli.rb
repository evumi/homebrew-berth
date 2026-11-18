# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.27"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.27/berth-darwin-arm64", using: :nounzip
      sha256 "a5a030ee85eb8b51a706d136f32ffdfbc00b7b4542d00aa5432cc87333844ca4"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.27/berth-darwin-amd64", using: :nounzip
      sha256 "9d5a6a5332a20123e90fa2c2844af19b3dade6b42c3af594bd70389b004b507a"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.27/berth-linux-arm64", using: :nounzip
      sha256 "fad1ba0a657c9b37de1ea7f44b0a80c1375d6969acd70c93e96708d282e22834"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.27/berth-linux-amd64", using: :nounzip
      sha256 "a48869169f2216f5c44e50fdaa9d25dab67f2c865d76682d851e2359b608ee41"
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
