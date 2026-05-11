cask "picardas-git-credential-manager" do
  version "2.8.0"
  sha256 "687ab927a4e2aa2e3298a777c0185f6e1b85bef0e77e7010fb0f6929da2c8b4e"

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
