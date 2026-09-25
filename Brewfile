# taps
tap "jandedobbeleer/oh-my-posh"
tap "nikitabobko/tap"
tap "wouterdebie/tap"

# formulae
brew "bat"
brew "eza"
brew "fish"
brew "git-delta"
brew "herdr", restart_service: :changed
brew "jandedobbeleer/oh-my-posh/oh-my-posh", trusted: true
brew "lazygit"
brew "mise"
brew "tailscale"
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

if ENV["HOMEBREW_PROFILE"] == "compooter"
  cask "discord"
  cask "opera"
  cask "whatsapp"
end

if ENV["HOMEBREW_PROFILE"] == "upbook"
  brew "glab"
  cask "slack"
end
