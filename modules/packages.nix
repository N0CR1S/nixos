
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    ani-cli
    curl
    fastfetch
    firefox
    fuzzel
    git
    gh
    htop
    kdePackages.dolphin
    localsend
    nano
    ollama
    pkgs.osu-lazer
    python313
    vim
    virtualbox
    vlc
    wget
  ];
}
