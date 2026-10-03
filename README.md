# dotfiles

`~/`

## Useful commands

```bash
# Install all the packages
pkginstall
```

## Mac mini sleep settings

Omarchy stays awake across logins, and the custom `potibas.lock` plugin keeps screen locking from turning off the display. The clone keeps a local copy of Omarchy's lock code; review it when upstream lock-screen code changes.

After restoring these dotfiles, run `macmini-no-sleep` to install the systemd sleep configuration under `/etc` and mask all sleep and hibernation targets. It requires sudo. No reboot is needed.

To restore system sleep support:

```bash
sudo rm /etc/systemd/sleep.conf.d/99-never-sleep.conf
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target
```

To restore idle locking and the stock lock screen, select `omarchy.lock` in place of `potibas.lock` in `~/.config/omarchy/shell.json`, remove `omarchy.lock` from `disabledPlugins`, remove `potibas.lock` from `cloneSourceRestores`, then run `omarchy restart shell` and `omarchy toggle idle allow-idle`.
