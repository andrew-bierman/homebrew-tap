cask "fantasma" do
  version "0.4.8"
  sha256 "d7bff863d2bd9d4ae92aa7ff9d01fd0e79e76378e6c20020de1aea599a780525"

  url "https://github.com/andrew-bierman/fantasma/releases/download/v#{version}/Fantasma-#{version}-arm64.zip"
  name "Fantasma"
  desc "Ghostty-powered quick-launch terminal overlay for macOS"
  homepage "https://github.com/andrew-bierman/fantasma"

  app "Fantasma-#{version}/Fantasma.app"

  caveats "Apple silicon only."
end
