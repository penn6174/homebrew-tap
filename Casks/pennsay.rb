cask "pennsay" do
  version "1.0.3,2"
  sha256 "292571d25620b4b0c22662f7ef475fc96a9cbc23b8f13a3f07bc0d90faf3fb3d"

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
