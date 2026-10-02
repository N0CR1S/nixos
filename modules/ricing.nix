{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    cava
    cbonsai
    cmatrix
    cowsay
    cool-retro-term
    fastfetch
    nyancat
    oneko
    pipes
    tty-clock
    xeyes
  ];
}
