cask "soundcloud-desktop" do
  version "0.2.5"
  sha256 "a0460ddc0f44f51008662ef4ca78022c8e87f8f8175c44a97fed74052b649c77"

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
