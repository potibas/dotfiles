# dotfiles

`~/`

## Useful commands

```bash
# Install all the packages
pkginstall

# Docker without sudo
sudo usermod -aG docker $USER
newgrp docker
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

## Keyboard layouts

Hyprland uses `us` and `br` (ABNT2), set in `~/.config/hypr/input.lua`. Super+[
and clicking the bar widget both run `keyboard-layout-next`, which moves every
keyboard to the same layout. A keyboard that connects starts on US whatever the
others are on, so the `potibas.keyboard-layout` widget brings it into line with
the rest within about 10 seconds; press Super+[ to fix it sooner.

The KA-689 Bluetooth keyboard is physically Portuguese ISO and has Fn where Ctrl
usually is, so its OS-mode combos are easy to hit by accident. In the wrong mode
it sends the wrong keys in every app: the top-left key types `<>` and the keys
near Enter come out in the wrong places. Hyprland still reports US, so nothing
looks wrong in `hyprctl devices`. Hold **Fn+Q** (the key labelled iOS) to restore
it. To check which key code a key actually sends:

```bash
wev -f wl_keyboard:key | grep -E "key: [0-9]+|sym:"
```

## Google Drive mount

After restoring the dotfiles, run `setup-gdrive`. It installs rclone and FUSE 3
on Omarchy/Arch if needed, then prompts for the downloaded Google OAuth **Desktop
app** credentials JSON. You can also pass the path directly:

```bash
setup-gdrive ~/Downloads/client_secret_example.apps.googleusercontent.com.json
```

Complete Google authorization in the browser when prompted. Drive mounts at
`~/gdrive`; the user service starts at boot and survives logout. The daily check
runs at midnight (local time), with an additional check after boot and catch-up
for missed runs. Rclone refreshes access tokens automatically; when authorization
is revoked or expires, the checker opens Google login in the desktop session.
Google sign-in still requires your interaction. Checks require a working network;
network failures do not trigger reauthorization.

Rerunning setup preserves the login for the same OAuth client. It refuses to
replace a remote using different credentials or mount over local files. The
credentials and tokens live in private `~/.config/rclone/rclone.conf`; do not add
that file or the downloaded credentials JSON to yadm.

```bash
systemctl --user status rclone-gdrive.service
systemctl --user start rclone-gdrive-auth.service  # Check credentials now
journalctl --user -u rclone-gdrive-auth.service
```
