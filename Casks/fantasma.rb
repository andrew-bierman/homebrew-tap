cask "fantasma" do
  version "0.2.0"
  sha256 "7df9814c6a804ddda577c907b6c825d4dafdbab66c40b4f8a0850e0855bb45cc"

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
