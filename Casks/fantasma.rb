cask "fantasma" do
  version "0.4.10"
  sha256 "22d9f1d4f9746258ebaba1c19e874d0a2ad0bfc666e712f04fdd48e783d870de"

  url "https://github.com/andrew-bierman/fantasma/releases/download/v#{version}/Fantasma-#{version}-arm64.zip"
  name "Fantasma"
  desc "Ghostty-powered quick-launch terminal overlay for macOS"
  homepage "https://github.com/andrew-bierman/fantasma"

  app "Fantasma-#{version}/Fantasma.app"

  caveats "Apple silicon only."
end
