{ config, pkgs, lib, ... }:
{
  # Light/Dark mode auto switch
  system.defaults.NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;

  # Dock stuff
  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-delay = 0;
  system.defaults.dock.autohide-time-modifier = 0;
  system.defaults.dock.tilesize =  50;
  system.defaults.dock.show-process-indicators = true;
  system.defaults.dock.launchanim = false;
  system.defaults.dock.mineffect = "scale";
  system.defaults.dock.minimize-to-application = true;

  # Finder Stuff
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;
  system.defaults.finder.FXPreferredViewStyle = "Nlsv";
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowStatusBar = true;
  system.defaults.NSGlobalDomain.NSTableViewDefaultSizeMode = 2;

  # Misc

  # Login Window
  system.defaults.loginwindow.DisableConsoleAccess = true;
  system.defaults.loginwindow.GuestEnabled = false;
  
  # Menu Bar 
  system.defaults.menuExtraClock.IsAnalog = true;
  system.defaults.menuExtraClock.ShowDate = 2; # Off
  system.defaults.menuExtraClock.ShowDayOfMonth = false;
  system.defaults.menuExtraClock.ShowDayOfWeek = false;




}
