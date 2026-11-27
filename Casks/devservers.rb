cask "devservers" do
  version "1.0.4"
  sha256 "03fdfe54d98821d5e40fefc42cc5b21a50c05e37a6ac0c0bcd4e043eece5b1a3"

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
