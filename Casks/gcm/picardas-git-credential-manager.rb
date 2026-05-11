cask "picardas-git-credential-manager" do
  arch arm: "arm64", intel: "x64"

  version "2.8.0"

  on arm do
    shas256 "687ab927a4e2aa2e3298a777c0185f6e1b85bef0e77e7010fb0f6929da2c8b4e"
  end
  on intel do
    sha256 "c304c5d704b35255c8b8a6e1d45cf3c58d1daaf08c73b3f8503eab53c45c6498"
  end

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
