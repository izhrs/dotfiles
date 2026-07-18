{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    yazi-flavors = {
      url = "github:yazi-rs/flavors";
      flake = false;
    };
    yazi-compress = {
      url = "github:KKV9/compress.yazi";
      flake = false;
    };

    zjstatus = {
      url = "github:dj95/zjstatus";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./system/configuration.nix
          inputs.catppuccin.nixosModules.catppuccin

          { nixpkgs.overlays = [ inputs.nur.overlays.default ]; }

          home-manager.nixosModules.home-manager
          ({ pkgs, ... }: {
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupCommand = "${pkgs.trash-cli}/bin/trash-put";

            home-manager.users.izhrs = import ./home;
          })
        ];
      };
    };
}
