# Aliases ---------------------------------------------------------------------
alias vim='nvim'
alias vi='nvim'

# Functions -------------------------------------------------------------------
function addsecret () {
  bw unlock
  echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"$2\",\"notes\":\"$(cat $1 | base64)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item 
  bw lock
  chezmoi cd
  echo "Echo the following into the template: {{ (bitwarden \"item\" \"$2\").notes | b64dec}"

}
