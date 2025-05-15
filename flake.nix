{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let 
     pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
     nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
 	   ./configuration.nix
	];
     };
  };
}
