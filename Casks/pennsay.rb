cask "pennsay" do
  version "1.0.0"
  sha256 "cc949223fc9c371985e030e987b8a78b7f96581cea4868db652dcfe14ce3fb1f"

  url "https://github.com/penn6174/pennsay/releases/download/v#{version}/PennSay-v#{version}.dmg"
  name "PennSay"
  desc "macOS voice input with LLM refinement by PENN"
  homepage "https://github.com/penn6174/pennsay"

  app "PennSay.app"

  zap trash: [
    "~/Library/Preferences/com.voiceinput.app.plist",
    "~/Library/Application Support/DoubaoMurmur",
    "~/Library/Logs/DoubaoMurmur",
  ]
end
