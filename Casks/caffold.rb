cask "caffold" do
  version "0.19.7"
  sha256 "650ea365547b7eb1a6aa60569606fb2c3d83d7d0a349e67dda07b523147489ef"

  url "https://github.com/panarch/caffold/releases/download/v#{version}/Caffold-Server-#{version}-macos-arm64.zip"
  name "Caffold Server"
  desc "Browser-based review and control surface for Codex-backed development tasks"
  homepage "https://github.com/panarch/caffold"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Caffold Server.app"
  binary "#{appdir}/Caffold Server.app/Contents/Resources/caffold", target: "caffold"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Caffold Server.app"]
  end

  zap trash: [
    "~/Library/Application Support/Caffold",
    "~/Library/Logs/Caffold",
    "~/Library/Preferences/io.panarch.caffold.server.plist",
  ]
end
