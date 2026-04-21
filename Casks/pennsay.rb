cask "pennsay" do
  version "1.0.3"
  sha256 "8c36ae2df6ba06d5bcf8db4449937eb7edf8d09c32e1705282237cb40739d566"

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
