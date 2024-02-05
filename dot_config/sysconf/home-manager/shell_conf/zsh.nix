{ pkgs, ... }:
{
  enable = true;
  dotDir = ".config/zsh";

  initExtraFirst = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
      source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      ZSH_TMUX_AUTOSTART=true
      source $ZDOTDIR/plugins/catppuccin-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
  '';

  initExtraBeforeCompInit = ''
  '';

  initExtra = ''
  [[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh

  path+=('/Users/isaacgrannis/.local/bin/')"
  eval "$(zoxide init zsh)

  '' + (import ./functions.nix {a=0;}) + ''
      command_not_found_handler() {
        local input="$*"
        local formatted=""
        local arg

        # Loop over each argument in the input string
        for arg in $input; do
        # If the argument contains spaces, enclose it in quotes
        if [[ $arg == *[[:space:]]* ]]; then
            arg="\"$arg\""
        fi

        # Append the argument to the formatted string
        formatted+="$arg "
        done
        # Remove the trailing space
        formatted=''${formatted%?}

        echo "Command '$formatted' not found, did you mean:"
        sgpt --shell "User input: '$formatted'. If it seems like the wrong command, just output the correct one."
      }
  '';

  profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
  
  shellAliases = (import ./aliases.nix {a=0;});


  plugins = [
    {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
          hash = "sha256-gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
        };
      }
    {
        name = "catppuccin-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "zsh-syntax-highlighting";
          rev = "06d519c20798f0ebe275fc3a8101841faaeee8ea";
          hash = "sha256-Q7KmwUd9fblprL55W0Sf4g7lRcemnhjh4/v+TacJSfo=";
        };
      }
  ];

  prezto = {
      enable = true;
      editor = {
          dotExpansion = true;
          keymap = "vi";
      };
      extraConfig = ''
      zstyle ':prezto:module:utility' safe-ops 'no'
      zstyle ':prezto:module:utility' correct 'no'
      '';

      pmodules = [
          "syntax-highlighting"
          "editor"
          "environment"
          "history"
          "autosuggestions"
          "directory"
          "spectrum"
          "utility"
          "git"
          "osx"
          "archive"
          "completion"
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

}
