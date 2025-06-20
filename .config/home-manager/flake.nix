{
  description = "Home Manager configuration of izhrs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-flavors = {
      url = "github:yazi-rs/flavors";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."izhrs" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
          ./home.nix
          ./hyprland.nix
          ./gnome.nix
          ./kitty.nix
          ./starship.nix
          ./yazi.nix
          ./fastfetch.nix
          ./git.nix
          ./lazygit.nix
          ./virt-manager.nix
          ./spicetify.nix
          ./zsh.nix
        ];

      };
    };
}
