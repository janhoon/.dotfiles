{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  environment.systemPackages = [ 
    pkgs.vim
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
  ];

  services.nix-daemon.enable = true;

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

  programs.zsh.enable = true;  # default shell on catalina

  users.users."jan.hoon" = {
    name = "jan.hoon";
    home = "/Users/jan.hoon";
  };

  home-manager.users."jan.hoon" = {pkgs, ...}: {
    home.stateVersion = "23.05";

    home.sessionPath = [ "$HOME/.local/bin" ];

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      pkgs.neovim-unwrapped
      pkgs.ripgrep
      pkgs.go
      pkgs.nodejs_20
      pkgs.maven
      pkgs._1password
      pkgs.podman-tui
      pkgs.lazydocker
      pkgs.direnv
      pkgs.postgresql_15
      pkgs.k3d
      pkgs.k9s
      pkgs.tilt
    ];

    programs.fzf = {
      enable = true;
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

    programs.java = {
      enable = true;
      package = pkgs.openjdk21_headless;
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
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
