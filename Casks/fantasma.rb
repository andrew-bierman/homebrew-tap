cask "fantasma" do
  version "0.4.6"
  sha256 "6d20ab22567aadd351493fc2cbe91e5e6abed9726cf688af58ffeddcaade630c"

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
