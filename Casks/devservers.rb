cask "devservers" do
  version "1.0.3"
  sha256 "55fb11ce525f3c96d60ad4dfe379baf0bd907f8feeeadb9223040761dd9a3832"

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
