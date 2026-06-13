cask "soundcloud-desktop" do
  version "0.2.2"
  sha256 "ef52c994178f7e9e518d91808abe97e92a2928acb0913359b68bb99d3edf8335"

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
