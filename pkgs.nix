# various linux cli util

{ pkgs, ... }:

with pkgs; [
  # cli tools
  claude-code
  k9s
  tree
  vagrant
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
  qemu
  net-tools

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
  appimage-run
  lens
  discord
  davinci-resolve
  libreoffice
  qpwgraph
  tetrio-desktop
  ulauncher
  firefox
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
  wine
  opentabletdriver
  easyeffects
  virtiofsd
]

