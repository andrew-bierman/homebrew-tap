cask "fantasma" do
  version "0.4.7"
  sha256 "77bd7b9a74b25e8ebcf044efa519219c2b10190f164d04c7808698fe90ed9f52"

  url "https://github.com/andrew-bierman/fantasma/releases/download/v#{version}/Fantasma-#{version}-arm64.zip"
  name "Fantasma"
  desc "Ghostty-powered quick-launch terminal overlay for macOS"
  homepage "https://github.com/andrew-bierman/fantasma"

  app "Fantasma-#{version}/Fantasma.app"

  caveats <<~EOS
    Apple silicon only. Unnotarized build: on first launch, right-click
    Fantasma.app -> Open, or run:
      xattr -dr com.apple.quarantine ~/Applications/Fantasma.app
  EOS
end
