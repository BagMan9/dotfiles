{ pkgs, ... }:
{
  enable = true;
  dotDir = ".config/zsh";

  initExtraFirst = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
      source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      ZSH_TMUX_AUTOSTART=true
  '';

  initExtra = ''
      [[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh
  '' + (import ./functions.nix {a=0;});

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
  ];

  prezto = {
      enable = true;
      editor = {
          dotExpansion = true;
          keymap = "vi";
      };
      pmodules = [
          "syntax-highlighting"
          "editor"
          "environment"
          "history"
          "autosuggestions"
          "directory"
          "spectrum"
          "utility"
          "completion"
          "git"
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
