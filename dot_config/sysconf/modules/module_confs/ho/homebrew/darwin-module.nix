{ config, pkgs, lib, ... }:
{
  homebrew = {
      enable = true;
      brews = [
        "mas"
      ];
      casks = [
          "cardhop"
          "coteditor"
          "disk-inventory-x"
          "kindle-previewer"
          "qBittorrent"
          "thunderbird"
      ];
      global = {
          autoUpdate = false;
      };
      onActivation = {
          cleanup = "zap";
          autoUpdate = false;
          upgrade = true;
      };
  };
}
