cask "mini-notes" do
  version "1.2.0"
  sha256 "368274a26296f4fa16b9f35ad45519b8be02549832f2a199b788555e16612a58"

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
