{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/packages.nix
      ./modules/home-manager.nix
      ./modules/hyprland.nix
      ./modules/ricing.nix
      ./modules/recording.nix
    ];

# Nix / Nixpkgs
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };
  nixpkgs.config.allowUnfree = true;

# Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  hardware.enableRedistributableFirmware = true;
  zramSwap.enable = true;

# Networking
  networking.hostName = "6246";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall = {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };

# Localization
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "de_CH.UTF-8";
  console = {
    keyMap = "sg-latin1";
    # useXkbConfig = true;
  };
  # services.xserver.enable = true;
  # services.xserver.xkb.layout = "sg";
  # services.xserver.xkb.options = "eurosign:e,caps:escae";

# Hardware / Audio / Bluetooth
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.printing.enable = true;
  services.fstrim.enable = true;
  services.power-profiles-daemon.enable = true;

# Users / Security
  users.users.john = {
    isNormalUser = true;
    description = "John";
    extraGroups = [ "wheel" "networkmanager" ];
    # openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAA..." ];
  };
  # services.openssh = {
    # enable = true;
    # settings = {
      # PasswordAuthentication = false;
      # PermitRootLogin = "no";
    # };
  # };

# Maintenance
  services.journald.extraConfig = ''
    SystemMaxUse=500M
  '';
  # system.copySystemConfiguration = true;

# State Version
  system.stateVersion = "26.05";
}
