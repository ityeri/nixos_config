# it this configuration file to define what should be installed on;
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # udisks2 / polkit service
  services.udisks2.enable = true;
  security.polkit.enable = true;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    device = "nodev";
  };

  # Home epson printer setting
  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true; # Run QEMU as root, often necessary for bridged networking/GPU passthrough
      swtpm.enable = true; # Enables TPM for Windows 11 compatibility
      # ovmf.enable = true;  # Enables UEFI booting
    };
  };

  virtualisation.podman.enable = true;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  boot.binfmt.preferStaticEmulators = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [ "dvb_usb_rtl28xxu" ];

  networking.hostName = "it"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    xorg.libX11
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
  services.udev.packages = [ pkgs.rtl-sdr ];

  home-manager.backupFileExtension = "overwrite";

  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
    nanum
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "gtk";
  };

  xdg.mime = { # TODO I want to change a default image viewer...
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "asdf" ];
      "x-scheme-handler/file" = [ "asdf" ];
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.networkmanager.dns = "none";

  # Set your time zone.
  time.timeZone = "Asia/Seoul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ko_KR.UTF-8";
    LC_IDENTIFICATION = "ko_KR.UTF-8";
    LC_MEASUREMENT = "ko_KR.UTF-8";
    LC_MONETARY = "ko_KR.UTF-8";
    LC_NAME = "ko_KR.UTF-8";
    LC_NUMERIC = "ko_KR.UTF-8";
    LC_PAPER = "ko_KR.UTF-8";
    LC_TELEPHONE = "ko_KR.UTF-8";
    LC_TIME = "ko_KR.UTF-8";
  };

  i18n.inputMethod = {
    type = "kime";
    enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.opentabletdriver.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.it = {
    isNormalUser = true;
    description = "it";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "uinput"
      "disk"
    ];
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # rust-analyzer (mason) needs std sources; nixpkgs rustc ships no rust-src.
  environment.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };

  environment.systemPackages = with pkgs; [
    # (symlinkJoin {
    #   nmeame = "discord";
    #   paths = [ discord ];
    #   buildInputs = [ makeWrapper ];
    #   postBuild = ''
    #     wrapProgram $out/bin/discord \
    #       --add-flags "--ozone-platform=x11"
    #   '';
    # })
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    git
    xdg-utils
    glib
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # 요약: Nix OS 전체 버전 같은 느낌. 가능한 처음 설치했을때 값 그대로 죽을때까지 바꾸지 말라고함
  system.stateVersion = "25.11"; # Did you read the comment?
}

