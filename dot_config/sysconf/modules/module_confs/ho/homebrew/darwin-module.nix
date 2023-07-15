{ config, pkgs, lib, ... }:
{
  homebrew = {
      enable = true;
      casks = [
          "bitwarden"
          "cardhop"
          "coteditor"
          "disk-inventory-x"
          "kindle-previewer"
          "qBittorrent"
      ];
      onActivation = {
          cleanup = "zap";
        };
  };
}
