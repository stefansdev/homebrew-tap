cask "mini-notes" do
  version "1.1.0"
  sha256 "e7277ea3d4f835cf975a013969d8367c7c7b84f43b4db22d9ef768d6daec86b9"

  url "https://github.com/stefansdev/mini-notes/releases/download/v#{version}/MiniNotes.zip"
  name "Mini Notes"
  desc "Floating markdown notes window toggled by a global hotkey"
  homepage "https://github.com/stefansdev/mini-notes"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Mini Notes.app"

  # Ad-hoc signed, not notarized: clear quarantine so it opens without the Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mini Notes.app"]
  end

  # Notes are user data and are never removed; only preferences are.
  zap trash: "~/Library/Preferences/dev.stefans.mininotes.plist"
end
