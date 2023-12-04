{ config, pkgs, lib, ... }:
{
  homebrew = {
      enable = true;
      brews = [
        "python-tk"
      ];
      casks = [
          "coteditor"
          "disk-inventory-x"
          "kindle-previewer"
          "qBittorrent"
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
