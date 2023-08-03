{ config, pkgs, ... }:

let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  # hyprland = (import flake-compat {
  #   src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  # }).defaultNix;

in

{
  home.username = "janhoon";
  home.homeDirectory = "/home/janhoon";
  home.stateVersion = "22.11";
  home.sessionPath = [ "$HOME/.local/bin" ];


  # set some env vars

  # imports = [
  #   hyprland.homeManagerModules.default
  # ];

  # wayland.windowManager.hyprland = {
  #   enable = true;
  # };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    cmake
    docker-compose
    cool-retro-term
    gcc-unwrapped
    gh
    glibc
    gnumake
    go
    golangci-lint
    gopls
    helm-docs
    jq
    k3d
    k9s
    kubectl
    kubernetes-helm
    kustomize
    lazydocker
    libcxx
    llvmPackages_9.libcxxClang
    neovim-unwrapped
    nodejs
    obsidian
    python310
    ripgrep
    stdenv.cc.cc.lib
    teleport
    tree
    ufw
    yarn
    zlib
  ];

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Jan Hoon";
    userEmail = "jan.hoon@saltpay.co";
    signing = {
      signByDefault = true;
      key = null;
    };
    extraConfig = {
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
         };
      };
    };
  };

  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
  };

  programs.fzf = {
    enable = true;
    colors = {
      "bg+" = "#313244";
      "bg" = "#1e1e2e";
      "spinner" = "#f5e0dc";
      "hl" = "#f38ba8";
      "fg" = "#cdd6f4";
      "header" = "#f38ba8";
      "info" = "#cba6f7";
      "pointer" = "#f5e0dc";
      "marker" = "#f5e0dc";
      "fg+" = "#cdd6f4";
      "prompt" = "#cba6f7";
      "hl+" = "#f38ba8";
    };
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.yank
    ];
    extraConfig = "
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'catppuccino/tmux'
set -g @catppuccin_flavour 'mocha'
set -g @catppuccin_pill_theme_enabled on
set -g @catppuccin_user on
      ";
  };


  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };

    plugins = [
    {
      name = "zsh-fzf-tab-plugin";
      file = "fzf-tab.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "Aloxaf";
        repo = "fzf-tab";
        rev = "3aa44739958691c4de06496e5bb18e0a629edd6d";
        sha256 = "sha256-VK+qJsyo0rQ2FV6lzUPhGTYNznHCuu4eOCcREqaD8jQ=";
      };
    }
    {
      name = "zsh-forgit";
      file = "forgit.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "wfxr";
        repo = "forgit";
        rev = "22.11.0";
        sha256 = "ca7EM/F0Spsdr3MbjIVwbjLVXg6/qWGczBQHLCcpU5A=";
      };
    }
    ];
  };
}

