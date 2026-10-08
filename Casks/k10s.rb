cask "k10s" do
  version "0.2.0"
  sha256 "a0b4200cf75359363be7921c988326107cba342549b711528882c560ae14ceeb"

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
