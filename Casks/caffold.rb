cask "caffold" do
  version "0.2.0"
  sha256 "ce78e413e82d8f01b0c99bd45fc9f32f9b14248e8789b96c4064114080ccde19"

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
