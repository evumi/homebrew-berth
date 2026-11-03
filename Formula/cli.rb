# Generated from a minisign-verified Berth release; do not edit.
class Cli < Formula
  desc "Command-line client for the Berth self-hosted PaaS"
  homepage "https://github.com/evumi/homebrew-berth"
  version "0.0.65"

  on_macos do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.65/berth-darwin-arm64", using: :nounzip
      sha256 "99cc31377ae94131271f8a8a06519a0da655ebcc6d7d08d87b96f22293d6f9fb"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.65/berth-darwin-amd64", using: :nounzip
      sha256 "272362a096b2be8abd21cfd183754a9ac6a447182ad0e6c7d68ef23efd26d07e"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.bunship.site/berth/v0.0.65/berth-linux-arm64", using: :nounzip
      sha256 "200ec347605497f5b56b364eb39b6c13e44f7be6442dd890dd029c4bffa02b6a"
    end
    on_intel do
      url "https://releases.bunship.site/berth/v0.0.65/berth-linux-amd64", using: :nounzip
      sha256 "cd1a9506caf10b63175019b85d39c4837b901936620330214b831f6635f6e886"
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
