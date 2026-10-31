# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.38"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.38/berth-darwin-arm64", using: :nounzip
      sha256 "66de445d555c3fd39a44a25aaf0e0859adbf259b0652ffd17a0b835360600e7d"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.38/berth-darwin-amd64", using: :nounzip
      sha256 "87f7180fb977e28a456b91a4164014f3137e469fb61acb14a1cd01766e07493f"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.38/berth-linux-arm64", using: :nounzip
      sha256 "eee52cd15b93f385fa8d427cec31b97f1b6259b19b23b6f027eeb8c8890777d9"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.38/berth-linux-amd64", using: :nounzip
      sha256 "4fd86844492295f480a9211eefad047674010a54b94002010dad0485669eecd5"
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
