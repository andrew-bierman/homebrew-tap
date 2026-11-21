cask "fantasma" do
  version "0.3.1"
  sha256 "9da3b4ba6dc7f7c7c1acefc81a675f71fd2a2b82a76a7c94a7ede3b24edcc2ab"

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
