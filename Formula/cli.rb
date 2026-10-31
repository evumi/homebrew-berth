# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.44"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.44/berth-darwin-arm64", using: :nounzip
      sha256 "cd52f1db08a12f63821d15bc1c996c65b204412d96f8c076dffa028a02a2f216"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.44/berth-darwin-amd64", using: :nounzip
      sha256 "d8a1236268d61d1e40180a9d80eab37e6955c7173b332ee274b66c58223f5fa2"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.44/berth-linux-arm64", using: :nounzip
      sha256 "38f47c2ab018382ffc7a253ddc36d424ace42396e9367fb58c2b9697ac647dbd"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.44/berth-linux-amd64", using: :nounzip
      sha256 "14e1b038f2efa8d4e4f8faede46f4756d6750d0d4cbf44eefa01fc1cae660c93"
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
