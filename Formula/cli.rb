# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.59"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.59/berth-darwin-arm64", using: :nounzip
      sha256 "e9d466122b94559ad264614bcf359df265e0106707acc20724d74d1ea679f4b6"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.59/berth-darwin-amd64", using: :nounzip
      sha256 "7d801d9d422b1381ada1a14300ed17c6e66407b42b99ac7108f60b3a769d011c"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.59/berth-linux-arm64", using: :nounzip
      sha256 "5150e2bceb40b30bc29e324d8fc8548652668316ab339d6b0b43255e86d51b4e"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.59/berth-linux-amd64", using: :nounzip
      sha256 "5367d9a37d3d838e6ee07801ad1eaccfd900de2525179f8ee5dce259493a8962"
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
