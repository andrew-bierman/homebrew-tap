cask "fantasma" do
  version "0.4.7"
  sha256 "a7006db57b0b7333d62d4cdcf8c09dda390194b26703b515c07a7a12407e37c5"

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
