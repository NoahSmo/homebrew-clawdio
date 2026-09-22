cask "clawdio" do
  version "0.1.0"
  sha256 "9c6785d415a995c83230f369ed93e0c6cb7e8fd723f1d05dbfcb69e9da8b3630"

  url "https://github.com/NoahSmo/clawdio/releases/download/v#{version}/Clawdio-#{version}.zip"
  name "Clawdio"
  desc "Claude Code quota and agent status in the notch, with a pixel art mascot"
  homepage "https://github.com/NoahSmo/clawdio"

  depends_on macos: :sonoma

  app "Clawdio.app"

  # Build signé ad-hoc, non notarisé : sans ça Gatekeeper refuse le lancement depuis Launchpad.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Clawdio.app"]
  end

  uninstall quit: "dev.clawdio.notch"

  zap trash: "~/Library/Preferences/dev.clawdio.notch.plist"
end
