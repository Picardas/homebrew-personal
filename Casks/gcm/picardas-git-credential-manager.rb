cask "picardas-git-credential-manager" do
  arch arm: "arm64", intel: "x64"

  version "2.7.3"
  sha256 arm:   "7051a5e953bcd37a182330a0f18bc6842c4cac143b537f8c49a8c5906d335c80",
         intel: "f172be74f3c8fb38c69a93464d6c07a911f2259a62304d0adc60142f8d2c9226"

  url "https://github.com/git-ecosystem/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.tar.gz",
      verified: "github.com/git-ecosystem/git-credential-manager/"
  name "Git Credential Manager"
  desc "Cross-platform Git credential storage for multiple hosting providers"
  homepage "https://aka.ms/gcm"

  livecheck do
    url "https://github.com/git-ecosystem/git-credential-manager/releases"
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
