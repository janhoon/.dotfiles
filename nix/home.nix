{ config, pkgs, ... }:

{
  home.username = "janhoon";
  home.homeDirectory = "/home/janhoon";
  home.stateVersion = "22.11";
  home.sessionPath = [ "$HOME/.local/bin" ];

  home.packages = with pkgs; [
    fzf
    glibc
    gcc-unwrapped
    python3
    python3Packages.psutil
    python311Packages.backports-zoneinfo
    gh
    gnumake
    go
    helm-docs
    k3d
    k9s
    kubectl
    kubernetes-helm
    lazydocker
    neovim-unwrapped
    nodejs
    ripgrep
    tmux
    tree
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
