{ config, pkgs, ... }:
let
  myLibraryPath = "${pkgs.stdenv.cc.cc.lib}/lib";
in
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  home.username = "janhoon";
  home.homeDirectory = "/home/janhoon";
  home.stateVersion = "22.11";
  home.sessionPath = [ "$HOME/.local/bin" ];
  home.sessionVariables = {
    LD_LIBRARY_PATH = myLibraryPath;
  };

  home.packages = with pkgs; [
    _1password
    _1password-gui
    gcc
    neovim-unwrapped
    nodejs
    fzf
    lazydocker
    k3d
    gnumake
    chromium
    google-chrome
    go
    cargo
    zip
    unzip
    python311
    python311Packages.python-lsp-server
    ripgrep
    openssl
    google-cloud-sdk
    obsidian
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
    userEmail = "janhoon97@gmail.com";
    signing = {
      signByDefault = true;
      key = null;
    };
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
        name = "zsh-fzf-plugin";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "3aa44739958691c4de06496e5bb18e0a629edd6d";
          sha256 = "sha256-VK+qJsyo0rQ2FV6lzUPhGTYNznHCuu4eOCcREqaD8jQ=";
        };
      }
      {
        name = "zsh-fzf-plugin";
        src = pkgs.fetchFromGitHub {
          owner = "wfxr";
          repo = "forgit";
          rev = "22.11.0";
          sha256 = "ca7EM/F0Spsdr3MbjIVwbjLVXg6/qWGczBQHLCcpU5A=";
        };
      }
    ];
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.yank
    ];
    extraConfig = "
set -g @plugin 'tmux-plugins/tmux-yank'
      ";
  };
}
