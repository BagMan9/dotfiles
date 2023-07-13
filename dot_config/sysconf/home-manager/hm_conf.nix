{ home-manager }:
{
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
	  home-manager.users.isaacgrannis = import ./home.nix;
}
