# Aliases ---------------------------------------------------------------------
alias vim='nvim'
alias vi='nvim'

# Functions -------------------------------------------------------------------
function AddSecret () {
  local filepath="${1/#~\//}"
  local internalPath= $(echo "$filepath" | sed 's|/\.\([^/]*\)|/dot_\1|g')
  bw unlock
  chezmoi add --template $1 
  echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"$2\",\"notes\":\"$(cat $1 | base64)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item
  chezmoi cd
  echo "{{ (bitwarden "item" "$2").notes | b64dec }}" > $internalPath.tmpl
  exit
  bw lock
}
