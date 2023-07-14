{ ... }:
{
    bwsesh="export BW_SESSION=$(bw unlock --raw)";
    chezup="chezmoi add ~/.config/nvim/lazy-lock.json && chezmoi update";
    sysup="darwin-rebuild switch --flake ~/.config/sysconf/";
    hmedit="chezmoi edit ~/.config/sysconf/home-manager";
    sysedit="chezmoi edit ~/.config/sysconf";
    fullup="chezup && sysup && source ~/.zshrc";
}
