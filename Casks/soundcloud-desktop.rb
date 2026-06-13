cask "soundcloud-desktop" do
  version "0.2.1"
  sha256 "9d9797bf5ebf4d023533057d9fa933c3bc94bb66d109cd7f7c00b2057db0acdf"

  url "https://github.com/inkitori/soundcloud-desktop/releases/download/v#{version}/SoundCloud.Desktop_#{version}_universal.dmg"
  name "SoundCloud Desktop"
  desc "Unofficial SoundCloud desktop client"
  homepage "https://github.com/inkitori/soundcloud-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :catalina

  app "SoundCloud Desktop.app"

  zap trash: [
    "~/Library/Application Support/com.enyouki.soundcloud",
    "~/Library/Caches/com.enyouki.soundcloud",
    "~/Library/Preferences/com.enyouki.soundcloud.plist",
    "~/Library/Saved Application State/com.enyouki.soundcloud.savedState",
    "~/Library/WebKit/com.enyouki.soundcloud",
  ]

  caveats <<~CAVEATS
    This app is not notarized with Apple. Clear the quarantine flag
    before first launch or macOS will claim the app is "damaged":

      xattr -cr "/Applications/SoundCloud Desktop.app"

    Optional: brew install ffmpeg (enables offline downloads as .m4a).
  CAVEATS
end
