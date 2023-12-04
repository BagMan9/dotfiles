{ config, pkgs, lib, ... }:
{
  homebrew = {
      enable = true;
      brews = [
        "mas"
        "python-tk"
        "sshfs"
      ];
      casks = [
          "cardhop"
          "coteditor"
          "disk-inventory-x"
          "kindle-previewer"
          "qBittorrent"
          "thunderbird"
          "middleclick"
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
