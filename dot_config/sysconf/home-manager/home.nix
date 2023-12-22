{ config, pkgs, ... }:
{
  home.username = "isaacgrannis";
  # Commented out the below for now, zsh seems to mess with it in some capacity and eliminating it did not break anything else
  #home.profileDirectory = "/Users/isaacgrannis";

  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    chezmoi
    tmux
    neovim
    git
    ripgrep
    fd
    fzf
    lazygit
    bitwarden-cli
    python311
    python311Packages.pip
    python311Packages.tkinter
    python311Packages.libtmux
    pipx
    micromamba
    zsh
    zsh-prezto
    delta
    (nerdfonts.override { fonts = [ "Hermit" ]; })
    gimp
    docker
    poetry
    universal-ctags
    reattach-to-user-namespace
    pam-reattach
    zoxide
    yq
    btop
    mc
    nodejs_20
    rustup
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

  programs.home-manager.enable = true;
}
