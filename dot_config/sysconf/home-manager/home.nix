{ config, pkgs, ... }:
{
  home.username = "isaacgrannis";
  # Commented out the below for now, zsh seems to mess with it in some capacity and eliminating it did not break anything else
  #home.profileDirectory = "/Users/isaacgrannis";

  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    pkgs.chezmoi
    pkgs.tmux
    pkgs.neovim
    pkgs.git
    pkgs.ripgrep
    pkgs.fd
    pkgs.fzf
    pkgs.lazygit
    pkgs.bitwarden-cli
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.python311Packages.tkinter
    pkgs.python311Packages.libtmux
    pkgs.pipx
    pkgs.micromamba
    pkgs.zsh
    pkgs.zsh-prezto
    pkgs.delta
    (nerdfonts.override { fonts = [ "Hermit" ]; })
    pkgs.gimp
    pkgs.docker
    pkgs.poetry
    pkgs.universal-ctags
    pkgs.reattach-to-user-namespace
    pkgs.pam-reattach
    pkgs.zoxide
    pkgs.yq
    pkgs.btop
    pkgs.mc
    pkgs.nodejs_20
	];

  # Fonts
  fonts.fontconfig.enable = true;

  # Package configuration
  # ---------------------

  # FZF
  programs.fzf = (import ./progam_conf/fzf.nix {a=0;});

  
  # Git
  programs.git = (import ./progam_conf/git.nix {a=0;});
  # Neovim
  programs.neovim = {
      defaultEditor = true;
      vimAlias = true;
      vimdiffAlias = true;
  };

  # Zsh
  programs.zsh = (import ./shell_conf/zsh.nix {pkgs=pkgs;});


  home.file = {
  };

  home.sessionVariables = {
    EDITOR="nvim";
    VISUAL="nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
