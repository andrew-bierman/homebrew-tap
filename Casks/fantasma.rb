cask "fantasma" do
  version "0.2.0"
  sha256 arm64: "4f74ca9468f438f75d13cc450aa724ca82a111fe23f716815d4096d889eca52d"

  url "https://github.com/andrew-bierman/fantasma/releases/download/v#{version}/Fantasma-#{version}-arm64.zip"
  name "Fantasma"
  desc "Ghostty-powered quick-launch terminal overlay for macOS"
  homepage "https://github.com/andrew-bierman/fantasma"

  app "Fantasma-#{version}/Fantasma.app"

  caveats <<~EOS
    Unnotarized build: on first launch, right-click Fantasma.app -> Open,
    or run: xattr -dr com.apple.quarantine ~/Applications/Fantasma.app
  EOS
end
