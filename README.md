# Covenant
> A formal, solemn, and binding agreement between multiple computers  

<img width="1456" height="816" alt="511664216-88a435cb-2ddf-4709-bb99-d6a41871a2a9" src="https://github.com/user-attachments/assets/82264ecb-fe08-4f15-b0b1-1599b2d5a020" />

## Prerequisites
Sign in to Apple Account first! `mas` needs it for the App Store

## Installation

> [!TIP]
> If something fails halfway, just run it again

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/noobieoffrailz/covenant/main/bootstrap.sh)" -- <Name>
```

The script will:
- install `Homebrew`
- clone this repo
- rename the machine to `<Name>` (it asks if you leave that out)
- run `brew bundle` and then the playbook

### Postrequisites

These need to be done manually after installation:

- **Log out and back in**: this will apply rest of the changes
- **1Password**: sign in, and enable "SSH Agent"
  - Settings → Developer → turn on "Use the SSH Agent" and "Integrate with 1Password CLI"
- **Tailscale**: sign in, and enable "CLI Integration"
  - Settings → CLI Integration → "Add Now"
- **System Preferences**:
  - allow "Accessibility" for installed apps
  - update "Battery" charge limit

## Day to day

- **Local changes**: everything is symlinked, so changes are reflected instantly
- **Remote changes**: a git hook re-runs the playbook automatically after `git pull`
- **New packages**: add to `Brewfile`, followed by `brew bundle`.

To run the playbook by hand (add `--ask-become-pass` if it needs sudo):

```fish
ansible-playbook ansible/site.yml --limit (hostname -s)
```

## New additions

**A new machine** needs three things, all named after `hostname -s`:

- an entry in `ansible/inventory.yml`
- `ansible/host_vars/<Name>.yml`
- `tools/fish/config/machines/<Name>.fish`

For additional git identities, add `tools/git/config/profiles/<profile>.profile`.

**A new tool**
- make a `tools/<tool>/` folder with a `config/` folder, a `<tool>.fish`, or both
- the `.fish` file also has to be added to the list in `config.fish`

**A launch agent**
- Put the plist in `macos/LaunchAgents/` and add its name to `launch_agents`, either in `ansible/group_vars/macs.yml` (every machine) or in a machine's `host_vars`

**A macOS setting**
- add a line to `macos_defaults` in `ansible/group_vars/macs.yml`

**A theme**
- there's a short README in `tools/eza/config/themes/catppuccin/` and `tools/lazygit/config/themes/catppuccin/`

## Gotchas

- Taking a launch agent off `launch_agents` doesn't remove it automatically!
  - unload with `launchctl bootout gui/(id -u)/<label>` and delete its link from `~/Library/LaunchAgents`
- Ghostty reads settings only on launch. If you don't see changes, reload (`Cmd+Shift+,`)
- The menu bar settings are undocumented numbers, so a macOS update might break them
- `com.tailscale.up` exists because the Tailscale app [doesn't reconnect after login - tailscale#21092](https://github.com/tailscale/tailscale/issues/21092). Remove when fixed.

## Credits

The Catppuccin themes for eza and lazygit are © Catppuccin, MIT licensed.
