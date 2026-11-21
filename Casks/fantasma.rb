cask "fantasma" do
  version "0.4.9"
  sha256 "cfcfcce6fd7bad5964486ff9f451abdfbcee2fe5ec5249fb5c0353d5177d205b"

  url "https://github.com/andrew-bierman/fantasma/releases/download/v#{version}/Fantasma-#{version}-arm64.zip"
  name "Fantasma"
  desc "Ghostty-powered quick-launch terminal overlay for macOS"
  homepage "https://github.com/andrew-bierman/fantasma"

  app "Fantasma-#{version}/Fantasma.app"

  caveats "Apple silicon only."
end
