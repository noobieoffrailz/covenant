# taps
tap "jandedobbeleer/oh-my-posh"
tap "nikitabobko/tap"
tap "wouterdebie/tap"

# formulae
brew "ansible"
brew "bat"
brew "eza"
brew "fish"
brew "git-delta"
brew "herdr", restart_service: :changed
brew "jandedobbeleer/oh-my-posh/oh-my-posh", trusted: true
brew "lazygit"
brew "mas"
brew "mise"
brew "neovim"
brew "tree"
brew "zoxide"

# casks
cask "1password"
cask "1password-cli"
cask "affinity"
cask "bruno"
cask "chatgpt"
cask "claude"
cask "figma"
cask "font-jetbrains-mono-nerd-font"
cask "ghostty"
cask "github-copilot-app"
cask "google-chrome"
cask "hyperkey"
cask "leader-key"
cask "linearmouse"
cask "nikitabobko/tap/aerospace", trusted: true
cask "philips-hue-sync"
cask "spotify"
cask "t3-code"
cask "tableplus"
cask "tailscale-app"
cask "wouterdebie/tap/davit", trusted: true
cask "zed"

# Mac App Store (requires signing in to the App Store first)
mas "1Password for Safari", id: 1569813296
mas "AdGuard for Safari", id: 1440147259
mas "Noir", id: 1592917505

if ENV["HOMEBREW_PROFILE"] == "compooter"
  cask "discord"
  cask "opera"
  cask "whatsapp"
end

if ENV["HOMEBREW_PROFILE"] == "upbook"
  brew "glab"
  cask "slack"
end
