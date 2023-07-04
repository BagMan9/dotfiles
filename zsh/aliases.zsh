# Aliases ---------------------------------------------------------------------
alias vim='nvim'
alias vi='nvim'

# Functions -------------------------------------------------------------------
function addsecret () {
  export BW_SESSION=$(bw unlock --raw)
  echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"$2\",\"notes\":\"$(cat $1 | base64)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item 
  bw lock
  echo "Echo the following into the template: {{ (bitwarden \"item\" \"$2\").notes | b64dec}"

}

function pyenv-c () {
  if [$1 = "new"]
  then
    cp ~/Utils/environment.yml ./
    nvim environment.yml
    conda env create -f environment.yml
    conda activate $(cat environment.yml | grep name | awk '{print $2}')
    poetry init
    poetry install
    conda-lock -k explicit --conda mamba
  fi

  if [$1 = "update"]
  then
    conda-lock -k explicit --conda mamba
    mamba update --file conda-osx-arm64.lock
    poetry update
  fi

  if [$1 = "pre"]
  then
    conda create --name $2 --file conda-osx-arm64.lock
    conda activate $2
    poetry install
  fi
}
