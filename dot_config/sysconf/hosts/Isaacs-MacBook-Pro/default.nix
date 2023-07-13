{ config, lib, pkgs, ... }:
{

  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
    
  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  users.users.isaacgrannis.home = /Users/isaacgrannis;

}
