cask "pennsay" do
  version "1.0.2"
  sha256 "619000b2ccfd3dcfc490b7c7ea5ab8b8fab602f4c97c1032f1e83f4f672e1559"

  url "https://github.com/penn6174/pennsay/releases/download/v#{version}/PennSay-v#{version}.dmg"
  name "PennSay"
  desc "macOS voice input with LLM refinement by PENN"
  homepage "https://github.com/penn6174/pennsay"

  app "PennSay.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PennSay.app"]
    system_command "/usr/bin/tccutil",
                   args: ["reset", "Accessibility", "com.voiceinput.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.voiceinput.app.plist",
    "~/Library/Application Support/DoubaoMurmur",
    "~/Library/Logs/DoubaoMurmur",
  ]
end
