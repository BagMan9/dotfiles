{ config, pkgs, ... }:
let
  addSymlink = pkg: pkg.overrideAttrs (oldAttrs: rec {
    postInstall = ''
      ${oldAttrs.postInstall or ""}
      mkdir -p $out/zsh-prezto/contrib/
      ln -s $out $out/zsh-prezto/contrib/
    '';
  });
in
{
  home.username = "isaacgrannis";
  # Commented out the below for now, zsh seems to mess with it in some capacity and eliminating it did not break anything else
  #home.profileDirectory = "/Users/isaacgrannis";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    pkgs.chezmoi
    pkgs.neovim
    pkgs.git
    pkgs.ripgrep
    pkgs.fd
    pkgs.fzf
    pkgs.lazygit
    pkgs.tmux
    pkgs.bitwarden-cli
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.pipx
    pkgs.micromamba
    pkgs.zsh
    pkgs.zsh-prezto
    (addSymlink pkgs.zsh-fzf-tab)
    pkgs.delta
    (nerdfonts.override { fonts = [ "Hermit" ]; })
    pkgs.gimp
  ];
  # Fonts
  fonts.fontconfig.enable = true;

  # Package configuration
  # ---------------------

  # FZF
  programs.fzf = (import ./progam_conf/fzf.nix {a=0;});

  # Tmux
  programs.tmux = {
      enable = true;
      baseIndex = 1;
      clock24 = true;
      keyMode = "vi";
      mouse = true;
      escapeTime = 10;
      sensibleOnTop = true;
      newSession = true;
      prefix = "C-Space";
      terminal = "screen-256color";
      plugins = with pkgs; [
          tmuxPlugins.vim-tmux-navigator
          tmuxPlugins.catppuccin
          tmuxPlugins.yank
      ];
      extraConfig = ''
        bind v split-window -v -c "#{pane_current_path}"
        bind h split-window -h -c "#{pane_current_path}"
        set-option -sa terminal-features ',xterm-256color:RGB'
      '';
    };
  
  # Git
  programs.git = (import ./progam_conf/git.nix {a=0;})
  # Neovim
  programs.neovim = {
      defaultEditor = true;
      vimAlias = true;
      vimdiffAlias = true;
  };
  # Zsh
  programs.zsh = (import ./shell_conf/zsh.nix {a=0;})


  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR="nvim";
    VISUAL="nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
