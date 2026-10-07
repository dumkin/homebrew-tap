cask "k10s" do
  version "0.1.1"
  sha256 "3f6c984a050859813fb600def02ad7ef04b1265224cb53ce1a4200f606d78285"

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
