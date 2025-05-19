cask "picardas-git-credential-manager" do
  arch arm: "arm64", intel: "x64"

  version "2.6.1"
  sha256 arm:   "8e61494a6ffc1789fc5ec12ef129be84257909f315dcaf102a8f882aa32e9a2d",
         intel: "427be39f1d2cac60ed74f765df11a4a004c639f4353d111f122b067ee2842871"

  url "https://github.com/git-ecosystem/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.tar.gz",
      verified: "github.com/git-ecosystem/git-credential-manager/"
  name "Git Credential Manager"
  desc "Cross-platform Git credential storage for multiple hosting providers"
  homepage "https://aka.ms/gcm"

  livecheck do
    url "https://github.com/git-ecosystem/git-credential-manager/releases"
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

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
