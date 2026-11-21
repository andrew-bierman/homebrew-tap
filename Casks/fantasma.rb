cask "fantasma" do
  version "0.4.9"
  sha256 "46573317bf561301b516e48a22c220753ac8eccec8f7afa372897f03f492f8ad"

  url "https://github.com/andrew-bierman/fantasma/releases/download/v#{version}/Fantasma-#{version}-arm64.zip"
  name "Fantasma"
  desc "Ghostty-powered quick-launch terminal overlay for macOS"
  homepage "https://github.com/andrew-bierman/fantasma"

  app "Fantasma-#{version}/Fantasma.app"

  caveats "Apple silicon only."
end
