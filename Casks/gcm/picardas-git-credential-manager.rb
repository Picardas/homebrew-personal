cask "picardas-git-credential-manager" do
  version "3.0.2"
  sha256 "2031e8f81683ff0bd835a762e6cfd0831e9d28cdd5a55b10135c73e9498750cc"

  url "https://github.com/git-ecosystem/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-arm64-#{version.major_minor_patch}.tar.gz"
  name "Git Credential Manager"
  desc "Cross-platform Git credential storage for multiple hosting providers"
  homepage "https://aka.ms/gcm"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "git-credential-manager"

  binary "git-credential-manager"

  postflight_steps do
    set_permissions "git-credential-manager", "+x"
    run "git-credential-manager", base: :staged_path, args: ["configure"]
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
