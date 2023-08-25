{ config, pkgs, lib, ...}:

{
  environment.systemPackages = [ 
    pkgs.alacritty
    pkgs.llvmPackages_16.libcxxClang
    pkgs.clang-tools_16
  ];


}
