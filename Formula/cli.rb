# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.1.20"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.20/berth-darwin-arm64", using: :nounzip
      sha256 "fc9473e9de186676dc77a3b7de13df4ac8052bd4bc9ce05151d4540b5b9cf3dd"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.20/berth-darwin-amd64", using: :nounzip
      sha256 "b233324e906573f40cc4278c0e23e47b7e42c7d0fad3dbd8894071d4e58675af"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.1.20/berth-linux-arm64", using: :nounzip
      sha256 "0087073e8672b93810bdeaca0f729342067d0391860b2d9c617e19ca16afe06e"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.1.20/berth-linux-amd64", using: :nounzip
      sha256 "510d3217f57086e61bfd15baa48d6782d3dfc621ba606d13109387eafe618e50"
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
