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
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
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
    documents = "/home/${username}/de/docs";
    download = "/home/${username}/down";
    music = null;
    pictures = null;
    publicShare = null;
    templates = null;
    videos = null;
  };

  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #     "inode/directory" = [ "nautilus" ];
  #   };
  # };
  #
  home.stateVersion = "25.05";
}
