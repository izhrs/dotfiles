{
  description = "Home Manager configuration of izhrs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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

    zjstatus = { url = "github:dj95/zjstatus"; };
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }@inputs:
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
          ./cosmic
          ./fastfetch
          ./firefox
          ./gemini
          ./git
          ./gtk
          ./helix
          ./inlyne
          ./kitty
          ./lazygit
          ./nwg-drawer
          ./rofi
          ./serpl
          ./shell
          ./starship
          ./swayimg
          ./thunderbird
          ./virtmanager
          ./wezterm
          ./yazi
          ./zathura
          ./zellij
          catppuccin.homeModules.catppuccin
        ];
      };
    };
}
