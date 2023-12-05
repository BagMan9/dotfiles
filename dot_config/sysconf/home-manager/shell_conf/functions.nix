{ ... }:
let
  functionList = {
    addSecret = ''
      function addsecret () {
        local prevSession=0
        if [$BW_SESSION = ""]
        then
          export BW_SESSION=$(bw unlock --raw)
          local prevSession=1
        fi
        echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"$2\",\"notes\":\"$(cat $1 | base64)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item 
        if [$prevSession = 1]
        then
          bw lock
        fi
        export SECRET_TMPL_KEY="{{ (bitwarden "item" "$2").notes | b64dec }}"
        echo "Echo \$SECRET_TMPL_KEY into the template file"
      }

    '';
    createPythonDevEnv = ''
      function pdev () {
        if [[ $1 == "init" ]] then
          mkdir -p $2
          python -m venv $2/venv/
          cd $2
          git init
          source venv/bin/activate
        elif [[ $1 == "activate" ]] then 
          source venv/bin/activate
        elif [[ $1 == "exit" ]] then
          deactivate
        fi
      }

    '';
    fullUpgrade= ''
      function fullUpgrade () {
          local prevSession=0
          while [ "$BW_SESSION" = "" ]
          do
            export BW_SESSION=$(bw unlock --raw)
            local prevSession=1
          done
          chezmoi add ~/.config/sysconf/flake.lock && chezmoi add ~/.config/nvim/lazy-lock.json && chezmoi update
          darwin-rebuild switch --flake ~/.config/sysconf/

        }

    '';

    MakeAndCd = ''
      function mkcd () {
          mkdir -p $1 && cd $1
        }
    '';

    PiDevelop = ''
      function enterpi () {
          sshfs -o allow_other rpi:/home/csc-student/ ~/mnt/pi-remote
          cd ~/mnt/pi-remote/
          tmux split-window -v "ssh rpi"
          nvim .
        }
    '';
    PiUnDev = ''
      function piexit () {
          umount ~/mnt/pi-remote/
        }
    '';
  };
    concatAttrs = attrs: builtins.concatStringsSep "" (builtins.attrValues attrs);
in
  concatAttrs functionList
