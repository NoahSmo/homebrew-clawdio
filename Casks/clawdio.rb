cask "clawdio" do
  version "0.2.0"
  sha256 "ac1cd11ccec9bf9eb9be541477c7815358d65e83b26366fd523c9a08b1b1d8d3"

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
