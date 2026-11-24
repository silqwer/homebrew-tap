cask "devservers" do
  version "1.0.1"
  sha256 "fc32d965c41103a0ed75723343240acb8e3e34bffedf1cd56a6def4fcca87ad9"

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

  # Ad-hoc signed and not notarized: clear the quarantine flag so Gatekeeper doesn't block launch
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DevServers.app"]
  end

  uninstall quit: "local.devservers"

  zap trash: "~/Library/Preferences/local.devservers.plist"

  caveats <<~EOS
    DevServers is ad-hoc signed and not notarized by Apple.
    The quarantine flag is removed on install so it can launch normally.
  EOS
end
