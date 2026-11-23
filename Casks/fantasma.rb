cask "fantasma" do
  version "0.4.11"
  sha256 "b5e63373b8f0d597f9eb711bc7e6494dda149227471742043a60d4bffaf7b26a"

  url "https://github.com/andrew-bierman/fantasma/releases/download/v#{version}/Fantasma-#{version}-arm64.zip"
  name "Fantasma"
  desc "Ghostty-powered quick-launch terminal overlay for macOS"
  homepage "https://github.com/andrew-bierman/fantasma"

  app "Fantasma-#{version}/Fantasma.app"

  caveats "Apple silicon only."
end
