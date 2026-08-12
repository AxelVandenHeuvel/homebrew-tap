cask "speakez" do
  version "0.1.0"
  sha256 "50148fd3362ffe013238b25a3a5157abbe755e5b6c2b8321a32c1d2fffdcfc76"

  url "https://github.com/AxelVandenHeuvel/speak-ez/releases/download/v#{version}/speakEZ-#{version}.zip"
  name "speakEZ"
  desc "Fully local dictation: hold a key, speak, clean text appears at your cursor"
  homepage "https://github.com/AxelVandenHeuvel/speak-ez"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "speakEZ.app"

  postflight do
    system_command "/usr/bin/open", args: ["#{appdir}/speakEZ.app"]
  end

  caveats <<~EOS
    On first launch, grant Microphone, Input Monitoring, and Accessibility,
    then use the menu bar's "Relaunch speakEZ" so macOS applies them.
    The speech model (~1 GB) downloads on first run.
  EOS

  zap trash: [
    "~/Library/Application Support/speakEZ",
    "~/Library/Application Support/FluidAudio",
  ]
end
