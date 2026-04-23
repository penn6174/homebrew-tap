cask "pennsay" do
  version "1.0.4,3"
  sha256 "881ca817157192d8660a1b9674fb9d9175c9d438952df4162f0561f463420788"

  url "https://github.com/penn6174/pennsay/releases/download/v#{version.before_comma}/PennSay-v#{version.before_comma}.dmg"
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
