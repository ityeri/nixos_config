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
  platformio
  ffmpeg

  # language support
  uv
  cargo
  nodejs
  clang
  jdk21_headless

  # de
  hyprpaper
  hyprcursor

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
  sdrpp
  vlc

  # ides
  jetbrains.idea
  jetbrains.pycharm
  jetbrains.webstorm
  vscode

  arduino-ide

  # others
  opentabletdriver
]
