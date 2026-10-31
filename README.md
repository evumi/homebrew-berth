# Berth CLI for Homebrew

Install the Berth command-line client on macOS or Linux (Apple Silicon/ARM64 and Intel/AMD64):

```sh
brew install evumi/berth/cli
berth version
brew upgrade evumi/berth/cli
```

Downloads come exclusively from the public Berth R2 release bucket at
https://releases.bunship.site/berth. No GitHub release token is needed.
Homebrew checks the pinned SHA-256 checksum. The update workflow verifies the release's
minisign signature and all four binaries before changing the formula. It checks for new
stable releases every 15 minutes and can also be run manually. Prereleases and downgrades
are not promoted. GitHub scheduling may delay a check.

For Homebrew installations, upgrade with `brew upgrade evumi/berth/cli`.
Standalone installations can use `berth self-update`; `berth update` manages panel/agent upgrades.
