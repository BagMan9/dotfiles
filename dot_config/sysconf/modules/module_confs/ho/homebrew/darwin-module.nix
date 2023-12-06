{ config, pkgs, lib, ... }:
{
  homebrew = {
      enable = true;
      brews = [
        "python-tk"
        "tmux-fingers"
      ];
      casks = [
          "coteditor"
          "disk-inventory-x"
          "kindle-previewer"
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
