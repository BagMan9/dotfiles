{
  description = "My Nix Config Flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.05";

      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";

      darwin.url = "github:lnl7/nix-darwin";
      darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
 
  outputs = { self, nixpkgs, home-manager, darwin, nixpkgs-stable, ... }@inputs:
    let
      plat_modules = import ./modules/diff_handler/module-select.nix { inherit (nixpkgs-stable) lib; };
      inherit (self) outputs;
    in
    {
    nixosConfigurations = {

      "Isaac-CSC-PI" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
	      specialArgs = { inherit inputs outputs; };
	      modules = [ 
            ./hosts/Isaac-Pi/default.nix
		        home-manager.nixosModules.home-manager
		        ( import ./home-manager/hm_conf.nix { inherit home-manager; } )
		        ] ++ plat_modules.nixos;
    };
    darwinConfigurations = {

      "Isaacs-MacBook-Pro" = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; 
        modules = [ 
            ./hosts/Isaacs-MacBook-Pro/default.nix
	          home-manager.darwinModules.home-manager
	          ( import ./home-manager/hm_conf.nix { inherit home-manager; } )
            ] ++ plat_modules.darwin;
      };
     };
   };
 };
}
