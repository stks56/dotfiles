{
  description = "Home Manager configuration of nixos";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-claude-code = {
      url = "github:sadjow/claude-code-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-codex-cli = {
      url = "github:sadjow/codex-cli-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gemini-cli = {
      url = "github:sadjow/gemini-cli-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-claude-code,
      nix-codex-cli,
      nix-gemini-cli,
      ...
    }:
    {
      homeConfigurations = {
        "elmin" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [
              nix-claude-code.overlays.default
              nix-codex-cli.overlays.default
              nix-gemini-cli.overlays.default
            ];
          };
          modules = [
            ./hosts/elmin/default.nix
          ];
        };

        "unizm" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            overlays = [
              nix-claude-code.overlays.default
              nix-codex-cli.overlays.default
              nix-gemini-cli.overlays.default
            ];
          };
          modules = [
            ./hosts/unizm/default.nix
          ];
        };
      };
    };
}
