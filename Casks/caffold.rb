cask "caffold" do
  version "0.7.1"
  sha256 "0a7686bc63d6cc5c27932ba709744142bca037aa0b008fc2a32335b26d6f7f5e"

  url "https://github.com/panarch/caffold/releases/download/v#{version}/Caffold-Server-#{version}-macos-arm64.zip"
  name "Caffold Server"
  desc "Browser-based review and control surface for Codex-backed development tasks"
  homepage "https://github.com/panarch/caffold"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Caffold Server.app"
  binary "#{appdir}/Caffold Server.app/Contents/Resources/caffold", target: "caffold"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Caffold Server.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Caffold",
    "~/Library/Logs/Caffold",
    "~/Library/Preferences/io.panarch.caffold.server.plist",
  ]
end
