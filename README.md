# NixOS Configuration

My personal NixOS setup: a **Hyprland** desktop themed with the **Caelestia** shell.

[NixOS](https://nixos.org) is a Linux distribution that is declarative and reproducible. Everything in this repository describes the system, so you can rebuild the same setup on your own machine.

## Features

- Hyprland (Wayland compositor)
- Caelestia shell (bar, launcher, notifications, wallpaper picker, settings)
- Fully declarative system configuration

## Installation

1. Install NixOS by following the [official installation guide](https://nixos.org/manual/nixos/stable/#sec-installation).
2. Clone this repository:
   ```sh
   git clone <repository-url> ~/nixos
   cd ~/nixos
   ```
3. **Replace `hardware-configuration.nix`** with the one generated for your machine:
   ```sh
   nixos-generate-config --show-hardware-config > hardware-configuration.nix
   ```
   See the [NixOS wiki](https://wiki.nixos.org) for details.
4. **Change the username and password** to your own (see below).
5. Build and switch to the configuration:
   ```sh
   sudo nixos-rebuild switch --flake .#<hostname>
   ```
6. Reboot.

## Configuration

### User account

The default username and password are placeholders. Change them before building, and do not keep a plain-text password in a public repository. Consider `hashedPassword` or `hashedPasswordFile` instead.

### Wallpapers

1. Put all your wallpapers in `~/Pictures/Wallpapers`.
2. Name one of them `wallpaper.jpg`. It is shown briefly at every startup while Caelestia is still loading.
3. Select any other wallpaper from the same folder in the Caelestia settings.

## Known limitations

Caelestia is not fully supported on NixOS yet. The important features work, but a few settings may have no effect. You are unlikely to notice this in daily use.

## Credits

- [Hyprland](https://hyprland.org)
- [Caelestia](https://github.com/caelestia-dots)
- [NixOS](https://nixos.org)

Have fun larping!
