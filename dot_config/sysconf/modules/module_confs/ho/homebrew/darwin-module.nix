{ config, pkgs, lib, ... }:
{
  homebrew = {
      enable = true;
      casks = [
          "calibre"
          "bitwarden"
          "cardhop"
          "coteditor"
          "disk-inventory-x"
          "kindle-previewer"
          "qBittorrent"
      ];
      onActivation = {
          cleanup "zap";
        };
  };
}
