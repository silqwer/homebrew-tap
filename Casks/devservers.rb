cask "devservers" do
  version "1.0.2"
  sha256 "0cdaadecce44edb3d67fcf37bf6f1475ea6227390a8dc739725d0d978dc1c72b"

  url "https://github.com/silqwer/devservers/releases/download/v#{version}/DevServers.zip"
  name "DevServers"
  desc "Menu bar app that shows which local dev servers are running and on which port"
  homepage "https://silqwer.github.io/devservers/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "DevServers.app"

  uninstall quit: "local.devservers"

  zap trash: "~/Library/Preferences/local.devservers.plist"

  caveats <<~EOS
    Upgrading quits DevServers. Open it again afterwards:
      open -a DevServers

    To launch it at login, add DevServers under
    System Settings → General → Login Items.
  EOS
end
