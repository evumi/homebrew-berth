# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.50"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.50/berth-darwin-arm64", using: :nounzip
      sha256 "b6bd8372d94f253bbee59ec74b0283fd6eaf244b597506bba3b8b92aa2ebf7f0"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.50/berth-darwin-amd64", using: :nounzip
      sha256 "4135dc15d457768f9464577c0cc885523f6a6595de33d124d8610724220a7df4"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.50/berth-linux-arm64", using: :nounzip
      sha256 "fe82252c0cf675fc59dd7bf6a2ff138059426b188ed0395046c47b2d1ed42c44"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.50/berth-linux-amd64", using: :nounzip
      sha256 "533729992f0d43bfd1e434863ef509b3b98551400a38dc7893dfd7fa0871826b"
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
