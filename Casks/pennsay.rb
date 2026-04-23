cask "pennsay" do
  version "1.0.4,6"
  sha256 "fe8d8844713f9cb70bcc08595bdcb392acc0ebea60ddf0a60b6f9ee862af7a2f"

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
