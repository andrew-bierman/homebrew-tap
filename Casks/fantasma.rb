cask "fantasma" do
  version "0.4.12"
  sha256 "41faa2212e1889ce3b3d5bdac3de3e3abc56362d31735053625138f2dd25d0ee"

  url "https://github.com/andrew-bierman/fantasma/releases/download/v#{version}/Fantasma-#{version}-arm64.zip"
  name "Fantasma"
  desc "Ghostty-powered quick-launch terminal overlay for macOS"
  homepage "https://github.com/andrew-bierman/fantasma"

  app "Fantasma-#{version}/Fantasma.app"

  caveats "Apple silicon only."
end
