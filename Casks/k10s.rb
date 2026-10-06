cask "k10s" do
  version "0.1.0"
  sha256 "7b475c718f781f06dae1e86ca7da41f3ba509eaf54191139dc956a1aece33a86"

  url "https://github.com/dumkin/k10s/releases/download/v#{version}/k10s-#{version}-macos-arm64.dmg"
  name "k10s"
  desc "Multi-cluster Kubernetes desktop client"
  homepage "https://github.com/dumkin/k10s"

  livecheck do
    url :url
    strategy :github_latest
  end

  # k10s updates itself; `brew upgrade` leaves it alone.
  auto_updates true
  depends_on arch: :arm64

  app "k10s.app"

  zap trash: [
    "~/Library/Application Support/io.dumkin.k10s",
    "~/Library/Caches/io.dumkin.k10s",
    "~/Library/Logs/io.dumkin.k10s",
    "~/Library/Preferences/io.dumkin.k10s.plist",
    "~/Library/Saved Application State/io.dumkin.k10s.savedState",
    "~/Library/WebKit/io.dumkin.k10s",
  ]
end
