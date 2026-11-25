{
  description = "Home Manager configuration of nixos";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-llm-agents = {
      url = "github:numtide/llm-agents.nix";
    };
    nix-pup-cli = {
      url = "github:DeevsDeevs/pup-cli-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-golangci-lint = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-llm-agents,
      nix-pup-cli,
      nix-golangci-lint,
      ...
    }:
    let
      llmAgentsOverlay = final: prev: {
        llm-agents = nix-llm-agents.packages.${prev.stdenv.hostPlatform.system};
      };
      golangciLintOverlay = final: prev: {
        golangci-lint = nix-golangci-lint.legacyPackages.${prev.stdenv.hostPlatform.system}.golangci-lint;
      };
    in
    {
      homeConfigurations = {
        "elmin" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [
              llmAgentsOverlay
              nix-pup-cli.overlays.default
              golangciLintOverlay
            ];
          };
          modules = [
            ./hosts/elmin/default.nix
          ];
        };

        "orpar" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [
              llmAgentsOverlay
              nix-pup-cli.overlays.default
              golangciLintOverlay
            ];
          };
          modules = [
            ./hosts/orpar/default.nix
          ];
        };

        "unizm" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            overlays = [
              llmAgentsOverlay
              nix-pup-cli.overlays.default
              golangciLintOverlay
            ];
          };
          modules = [
            ./hosts/unizm/default.nix
          ];
        };
      };
    };
}
