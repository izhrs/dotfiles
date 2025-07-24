{
  description = "Home Manager configuration of izhrs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

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
          ./btm
          ./fastfetch
          ./git
          ./gtk
          ./helix
          ./hypr
          ./lazygit
          ./rofi
          ./shell
          ./starship
          ./swaync
          ./virtmanager
          ./waybar
          ./wezterm
          ./yazi
        ];
      };
    };
}
