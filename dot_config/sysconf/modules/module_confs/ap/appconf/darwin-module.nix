{ config, pkgs, lib, ... }:


{
  environment.systemPackages =
    [ pkgs.alacritty
      pkgs.reattach-to-user-namespace
      pkgs.pam-reattach
    ];

  system.activationScripts.applications.text = lib.mkForce ''
    echo "setting up /Applications..." >&2
    applications="/Applications"
    nix_apps="$applications/Nix Apps"

    # Delete the directory to remove old links
    rm -rf "$nix_apps"
    mkdir -p "$nix_apps"

    find ${config.system.build.applications}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
            /usr/bin/osascript -e "
                set fileToAlias to POSIX file \"$src\" 
                set applicationsFolder to POSIX file \"$nix_apps\"

                tell application \"Finder\"
                    make alias file to fileToAlias at applicationsFolder
                    # This renames the alias; 'mpv.app alias' -> 'mpv.app'
                    set name of result to \"$(rev <<< "$src" | cut -d'/' -f1 | rev)\"
                end tell
            " 1>/dev/null
        done
  '';
  }
