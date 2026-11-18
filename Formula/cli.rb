# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.28"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.28/berth-darwin-arm64", using: :nounzip
      sha256 "f3b85ed592e918b7c4fbd1d04261ae4811afdb027693ab073b337a9a3668e7a2"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.28/berth-darwin-amd64", using: :nounzip
      sha256 "ce93c5604740c69bbf4c547ec2156abaa444607937229051b9f6ea6da7bed54a"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.28/berth-linux-arm64", using: :nounzip
      sha256 "99554bd62ed9f5c358e6b5d61c78f15d10718b35cb27b2166f10491c9907bae7"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.28/berth-linux-amd64", using: :nounzip
      sha256 "23f26a30a60bdb16d9cb55cd57402d5025a01e6b02461056b1723359f1ae6b2f"
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
