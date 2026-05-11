cask "picardas-git-credential-manager" do
  version "2.8.0"
  sha256 "a61399385e861b8e6e896d04e528eebe1214e002edbb98373e5a458dee194d56"

  url "https://github.com/git-ecosystem/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-arm64-#{version.major_minor_patch}.tar.gz",
      verified: "github.com/git-ecosystem/git-credential-manager/"
  name "Git Credential Manager"
  desc "Cross-platform Git credential storage for multiple hosting providers"
  homepage "https://aka.ms/gcm"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "git-credential-manager"

  binary "git-credential-manager"

  postflight do
    FileUtils.chmod "+x", "#{staged_path}/git-credential-manager"
    system_command "#{staged_path}/git-credential-manager",
                   args: ["configure"]
  end

  uninstall script: {
    executable: "git-credential-manager",
    args:       ["unconfigure"],
  }

  zap trash: [
    "~/Library/Preferences/git-credential-manager-ui.plist",
    "~/Library/Preferences/git-credential-manager.plist",
  ]
end
