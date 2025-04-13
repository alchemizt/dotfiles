{
  description = "Minimal Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { nixpkgs, home-manager, ... }: let
    system = "x86_64-linux";
    username = "dom";
    homeDirectory = "/home/${username}";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        ./modules/minimal.nix
        ./modules/zsh.nix
      ];
      extraSpecialArgs = {
        inherit username homeDirectory;
      };
    };
  };
}
