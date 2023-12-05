{ pkgs, ... }:
{
      enable = true;
      baseIndex = 1;
      clock24 = true;
      keyMode = "vi";
      mouse = true;
      escapeTime = 10;
      sensibleOnTop = true;
      newSession = true;
      prefix = "C-Space";
      terminal = "xterm-256color";
      plugins = with pkgs; [
          tmuxPlugins.vim-tmux-navigator
          tmuxPlugins.yank
          gitmux
          tmuxPlugins.tmux-fzf
          tmuxPlugins.power-theme
          tmuxPlugins.prefix-highlight
          tmuxPlugins.battery
          tmuxPlugins.resurrect
          tmuxPlugins.tmux-thumbs
          tmuxPlugins.fzf-tmux-url
      ];
      extraConfig = ''
        bind v split-window -v -c "#{pane_current_path}"
        bind h split-window -h -c "#{pane_current_path}"
        set-option -sa terminal-features ',xterm-256color:RGB'
      '';
}
