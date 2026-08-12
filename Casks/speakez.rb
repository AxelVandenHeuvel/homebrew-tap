cask "speakez" do
  version "0.1.1"
  sha256 "07cc09d843200f486bae4f1e0d62272daab6b8d3cf04e0bf44e1e5ffeb139439"

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
