{ config, pkgs, ... }:

{
  home.username = "isaacgrannis";
  home.profileDirectory = "/Users/isaacgrannis";

  home.stateVersion = "23.05";

  home.packages = [
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
    pkgs.oh-my-zsh
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

  programs.neovim = {
      defaultEditor = true;
      vimAlias = true;
      vimdiffAlias = true;
  };
  
  #programs.zsh = {
  #    oh-my-zsh = {
  #        enable = true;
  #        plugins = [ "fzf-tab" ];
  #    };
  #    enable = true;
  #};
    


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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
