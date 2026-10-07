cask "mini-notes" do
  version "1.3.0"
  sha256 "066fec74adb972e6404822e6195341a196a72f7f606e7dd4238e701a9d1c139b"

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
