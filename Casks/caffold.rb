cask "caffold" do
  version "0.18.4"
  sha256 "d22c35167dd79bbd81d739e54ac660899a73174efb190517b8cae192fe20c21a"

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
