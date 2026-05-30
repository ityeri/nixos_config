# various linux cli util

{ pkgs, ... }:

with pkgs; [
  # cli tools
  git
  gh
  htop
  fastfetch
  tmux
  pulseaudio
  detach
  platformio
  ffmpeg
  unzip
  nodePackages.prettier

  # language support
  nodejs
  clang
  jdk21_headless
  uv
  rustc
  cargo
  python314

  # de
  hyprpaper
  hyprcursor

  # gui apps
  tetrio-desktop
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
  gimp
  # for screenshot
  grim
  wl-clipboard-rs
  slurp
  qimgv

  obs-studio
  audacity
  kdePackages.kdenlive

  # ides
  jetbrains.idea
  jetbrains.pycharm
  jetbrains.webstorm
  vscode

  arduino-ide

  # others
  opentabletdriver
]
