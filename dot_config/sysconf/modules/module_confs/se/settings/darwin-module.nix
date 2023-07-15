{ config, pkgs, lib, ... }:
{
  # Light/Dark mode auto switch
  system.defaults.NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;

  # Dock stuff
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;
    autohide-time-modifier = 0.0;
    tilesize = 50;
    show-process-indicators = true;
    launchanim = false;
    mineffect = "scale";
    minimize-to-application = true;
  };

  # Finder Stuff
  system.defaults.finder = {
    FXEnableExtensionChangeWarning = false;
    FXPreferredViewStyle = "Nlsv";
    ShowPathbar = true;
    ShowStatusBar = true;
    AppleShowAllExtensions = true;
  };

  system.defaults.NSGlobalDomain.NSTableViewDefaultSizeMode = 2;

  # Login Window
  system.defaults.loginwindow.DisableConsoleAccess = true;
  system.defaults.loginwindow.GuestEnabled = false;
  
  # Menu Bar 
  system.defaults.menuExtraClock.IsAnalog = true;
  system.defaults.menuExtraClock.ShowDate = 2; # Off
  system.defaults.menuExtraClock.ShowDayOfMonth = false;
  system.defaults.menuExtraClock.ShowDayOfWeek = false;

  # Fonts
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Hermit" ]; })
  ];

}
