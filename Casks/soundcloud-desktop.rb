cask "soundcloud-desktop" do
  version "0.1.0"
  sha256 "f238f62cc101c0d9914f2e9275882d98c979dc33d27e976c5d9220ffcd7581c0"

  url "https://github.com/inkitori/soundcloud-desktop/releases/download/v#{version}/SoundCloud.Desktop_#{version}_universal.dmg"
  name "SoundCloud Desktop"
  desc "Unofficial SoundCloud desktop client"
  homepage "https://github.com/inkitori/soundcloud-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "SoundCloud Desktop.app"

  zap trash: [
    "~/Library/Application Support/com.enyouki.soundcloud",
    "~/Library/Caches/com.enyouki.soundcloud",
    "~/Library/Preferences/com.enyouki.soundcloud.plist",
    "~/Library/Saved Application State/com.enyouki.soundcloud.savedState",
    "~/Library/WebKit/com.enyouki.soundcloud",
  ]

  caveats <<~CAVEATS
    This app is not notarized with Apple. If you installed without
    --no-quarantine, clear the quarantine flag before first launch:

      xattr -cr "/Applications/SoundCloud Desktop.app"

    Optional: brew install ffmpeg (enables offline downloads as .m4a).
  CAVEATS
end
