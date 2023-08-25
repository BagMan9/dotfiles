{ config, pkgs, lib, ...}:

{
  environment.systemPackages =
    [ pkgs.alacritty
    ];


}
