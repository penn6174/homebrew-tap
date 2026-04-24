cask "pennsay" do
  version "1.0.7,10"
  sha256 "8d5c474941dbb22510139acb4cd58849597e723075dd789ceb196e2ff85fe03d"

  url "https://github.com/penn6174/pennsay/releases/download/v#{version.before_comma}/PennSay-v#{version.before_comma}.dmg"
  name "PennSay"
  desc "macOS voice input with LLM refinement by PENN"
  homepage "https://github.com/penn6174/pennsay"

  app "PennSay.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PennSay.app"]
    system_command "/usr/bin/tccutil",
                   args: ["reset", "Accessibility", "com.voiceinput.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/com.voiceinput.app.plist",
    "~/Library/Application Support/DoubaoMurmur",
    "~/Library/Logs/DoubaoMurmur",
  ]
end
