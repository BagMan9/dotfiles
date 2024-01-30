{ config, pkgs, lib, ... }:
{
  homebrew = {
      enable = true;
      brews = [
        "python-tk"
        "tmux-fingers"
        "gnuradio"
        "fuse-t"
        "fuse-t-sshfs"
      ];
      casks = [
          "coteditor"
          "disk-inventory-x"
          "kindle-previewer"
          "middleclick"
          "gimp"
          "bluetility"
      ];
      taps = [
        "Morantron/tmux-fingers"
        "macos-fuse-t/homebrew-cask"
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
