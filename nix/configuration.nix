{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./sway.nix
      ./hyprland.nix
      <home-manager/nixos>
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";

    enable = true;

    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    desktopManager.xterm.enable = false;
    windowManager.awesome.enable = true;
    windowManager.i3.enable = true;

    resolutions = [
    	{ x = 2560; y = 1440; }
    	{ x = 1920; y = 1200; }
    ];
  };

  virtualisation.docker.enable = true;

  hardware.opengl.enable = true;

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [ 
      (nerdfonts.override { fonts = [ "JetBrainsMono" "Hack" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "JetBrains Mono" ];
        sansSerif = [ "JetBrains Mono" ];
        monospace = [ "JetBrains Mono" ];
      };
    };
  };

  users.users.janhoon = {
    isNormalUser = true;
    description = "janhoon";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  services.getty.autologinUser = "janhoon";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    unstable.mesa
    vim
    st
    kitty
    firefox
    chromium
    wayland
  ];
  environment.pathsToLink = [ "/libexec" ];
  environment.variables = rec {
    HYPRLAND_LOG_WLR = "1";
  };

  system.stateVersion = "22.11";
}
