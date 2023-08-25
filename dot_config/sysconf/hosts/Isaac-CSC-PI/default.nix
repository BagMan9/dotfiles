{ config, pkgs, lib, ... }:

let
  hostname = "Isaac-CSC-PI";
  user = "guest";
  password = "guest";
  nixosHardwareVersion = "7f1836531b126cfcf584e7d7d71bf8758bb58969";

  timeZone = "America/New_York";
  defaultLocale = "en_US.UTF-8";
in {
  imports = [
	"${fetchTarball { 
	url = "https://github.com/NixOS/nixos-hardware/archive/${nixosHardwareVersion}.tar.gz";
	sha256 = "sha256:0gq6y5yf45gbf58icglnppd7pd4pnn1kd0yr9ld8zx2wqxwh5y0h";}}/raspberry-pi/4"
	];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking.hostName = hostname;


  services.openssh.enable = true;

  time.timeZone = "America/New_York";

  i18n = {
    defaultLocale = defaultLocale;
    extraLocaleSettings = {
      LC_ADDRESS = defaultLocale;
      LC_IDENTIFICATION = defaultLocale;
      LC_MEASUREMENT = defaultLocale;
      LC_MONETARY = defaultLocale;
      LC_NAME = defaultLocale;
      LC_NUMERIC = defaultLocale;
      LC_PAPER = defaultLocale;
      LC_TELEPHONE = defaultLocale;
      LC_TIME = defaultLocale;
    };
  };

  users = {
    mutableUsers = true;
    users."${user}" = {
      isNormalUser = true;
      password = password;
      extraGroups = [ "wheel" ];
    };
    users.isaacgrannis = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      };
    };
  programs.zsh.enable = true;
  # Enable GPU acceleration
  hardware.raspberry-pi."4".fkms-3d.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  hardware.pulseaudio.enable = true;

  system.stateVersion = "23.11";
}
