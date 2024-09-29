{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    cachix.url = "github:cachix/cachix";
    devenv.url = "github:cachix/devenv";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Disko
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, home-manager-unstable, cachix, devenv, nixpkgs-unstable, nixos-hardware, nix-darwin, nixos-wsl, ... }: {
    nixosConfigurations = {
      compage = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.default
          ./hosts/compage/configuration.nix
        ];
      };

      firanta = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jdoe = import ./hosts/firanta/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };

      # For future WSL config
      ubuntu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.05";
            wsl.enable = true;
          }
        ];
      };
    };

    darwinConfigurations = {
      EMB-2P2T1PXX = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.darwinModules.home-manager
          ./hosts/EMB-2P2T1PXX
        ];
      };

      neils-imac-pro = nix-darwin.lib.darwinSystem {
        system = "X86_64-darwin";
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.darwinModules.home-manager
          ./hosts/neils-imac-pro
        ];
      };

    };
  };
}
