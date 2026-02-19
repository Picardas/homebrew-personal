cask "picardas-git-credential-manager" do
  arch arm: "arm64", intel: "x86"

  version "2.7.0"
  sha256 arm:   "3f2797131f0857044efc2f7d3367cf04890d55c97f1301d8f5105babf8da78ea",
         intel: "4668f63eaa330e61144aab2ff4d4e53c9dec2166e9201d5ae265e7cdc3154dbf"

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
