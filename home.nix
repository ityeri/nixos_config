{ inputs, username, pkgs, ... }:

{
  imports = [
    ./modules/alacritty.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = import ./pkgs.nix { inherit pkgs; };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = ''
      source = ~/.config/hypr/hyprland-custom.conf
    '';
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style.name = "adwaita-dark";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = null;
    documents = null;
    download = "/home/${username}/down";
    music = null;
    pictures = null;
    publicShare = null;
    templates = null;
    videos = null;
  };

  home.stateVersion = "25.05";
}
