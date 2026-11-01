# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.52"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.52/berth-darwin-arm64", using: :nounzip
      sha256 "0713cbe30af26ffe2f3b4f62c3d257c1af179adafb97a2b54e3246d2a9530afd"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.52/berth-darwin-amd64", using: :nounzip
      sha256 "ca58cbe9e9ec5c3bc4072d625a7f6da542664f31d3c62ed76594b4cfd0d547b5"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.52/berth-linux-arm64", using: :nounzip
      sha256 "b2f83eada173719efac25d8c6c452ecfa9aa4104ae5b1ed7d457852a6739af40"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.52/berth-linux-amd64", using: :nounzip
      sha256 "283599acb487ee1c2643da2551cb7680bb4680fd8c9712438a6684133f6b7868"
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
