{
  description = "ryan's dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    home-manager,
    nixpkgs,
    ...
  }: let
    inherit (home-manager.lib) homeManagerConfiguration;

    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    legacyPackages = forAllSystems (s: let
      pkgs = nixpkgsFor.${s};
    in {
      homeConfigurations = {
        ryan = homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
          ];

          # lets you access inputs in home.nix
          extraSpecialArgs = inputs;
        };
      };
    });
  };
}
