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
      plugins = with pkgs.tmuxPlugins; [
          vim-tmux-focus-events
          vim-tmux-navigator
          yank
          tmux-fzf
          battery
          resurrect
          tmux-thumbs
          fzf-tmux-url
      ];
      extraConfig = ''
        bind v split-window -v -c "#{pane_current_path}"
        bind h split-window -h -c "#{pane_current_path}"
        set -g status-right '#{battery_status_bg} Batt: #{battery_icon} #{battery_percentage} #{prefix_highlight} | %a %h-%d %H:%M '
        set-option -sa terminal-features ',xterm-256color:RGB'
      '';
}
