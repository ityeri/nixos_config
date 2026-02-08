# various linux cli util

{ pkgs, ... }:

with pkgs; [
  # cli tools
  git
  htop
  fastfetch
  ripgrep
  tmux
  pulseaudio
  detach

  # language support
  python313
  cargo
  nodejs

  # de - hyprland
  hyprpaper
  hyprcursor

  opentabletdriver

  # gui apps
  ulauncher
  firefox
  discord
  vesktop
  krita
  nautilus
  pavucontrol
  prismlauncher
  steam
  gnome-sound-recorder

  # ides
  jetbrains.idea
  jetbrains.pycharm
  jetbrains.webstorm

  arduino-ide
]
