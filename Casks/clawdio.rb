cask "clawdio" do
  version "0.1.0"
  sha256 "1e15a7729b762a05b291f7fed5c8b8c1d2149884cb6c24b4cdc96ea5ea6959d8"

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
