# Aliases ---------------------------------------------------------------------
alias vim='nvim'
alias vi='nvim'
alias bwsesh='export BW_SESSION=$(bw unlock --raw)'
alias chezup='chezmoi add ~/.config/nvim/lazy-lock.json && chezmoi update'
alias darup='darwin-rebuild switch --flake ~/.config/darwin/'
# Functions -------------------------------------------------------------------
function addsecret () {
  local prevSession=0
  if [$BW_SESSION = ""]
  then
    export BW_SESSION=$(bw unlock --raw)
    local prevSession=1
  fi
  echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"$2\",\"notes\":\"$(cat $1 | base64)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item 
  if [$prevSession = 0]
  then
    bw lock
  fi
  echo "Echo the following into the template: {{ (bitwarden \"item\" \"$2\").notes | b64dec}"

}

function pyenv-c () {
  if [ "$1" = "new" ]
  then
    cp ~/Utils/environment.yml ./
    nvim environment.yml
    conda env create -f environment.yml
    conda activate $(cat environment.yml | grep name | awk '{print $2}')
    poetry init
    poetry install
    conda-lock -k explicit --conda mamba
  fi

  if [ "$1" = "update" ]
  then
    conda-lock -k explicit --conda mamba
    mamba update --file conda-osx-arm64.lock
    poetry update
  fi

  if [ "$1" = "pre" ]
  then
    conda create --name $2 --file conda-osx-arm64.lock
    conda activate $2
    poetry install
  fi
}
