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
  ];
  # Package configuration
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    colors = {
        fg = "-1";
        bg = "-1";
        hl = "33";
        "fg+" = "254";
        "bg+" = "235";
        "hl+" = "33";
        info = "136";
        prompt = "136";
        pointer = "230";
        marker = "230";
        spinner = "136";
      };
  };
  programs.git = {
      enable = true;
      userEmail = "115715725+BagMan9@users.noreply.github.com";
      userName = "Isaac Grannis";
      signing = {
          signByDefault = true;
          key = "9827C3A7F8C560A5";
        };
      delta = {
          enable = true;
      };
  };
  programs.neovim = {
      defaultEditor = true;
      vimAlias = true;
      vimdiffAlias = true;
  };
  
  programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";

      initExtraFirst = ''
          if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi
      '';

      initExtra = ''
          [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '' + (import ./shell_conf/functions.nix {a=0;});

      shellAliases = (import ./shell_conf/aliases.nix {a=0;});

      prezto = {
          enable = true;
          editor = {
              dotExpansion = true;
              keymap = "vi";
          };
          pmodules = [
              "syntax-highlighting"
              "git"
              "fzf-tab"
              "prompt"
          ];
          syntaxHighlighting = {
              highlighters = [
                  "main"
                  "brackets"
                  "pattern"
                  "line"
                  "cursor"
                  "root"
              ];
          };
          prompt.theme = "powerlevel10k";
          tmux.autoStartLocal = true;
        };
  };
    


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

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/isaacgrannis/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR="nvim";
    VISUAL="nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
