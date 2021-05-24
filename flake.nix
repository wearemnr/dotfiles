{
  description = "mbpnix";

  inputs = {
    wamnr.url = "github:wearemnr/nixpkgs?ref=master";
    stable.url = "github:NixOS/nixpkgs?ref=nixos-20.09";
    unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    master.url = "github:NixOS/nixpkgs?ref=master";
    home-manager.url = "github:nix-community/home-manager";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/staging";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, wamnr, stable, master, unstable, home-manager, utils, nur, ... }@inputs:
    utils.lib.systemFlake {
      inherit self inputs;

      channels.wamnr = {
        input = wamnr;
        config = {
          allowUnfree = true;
        };
      };

      channels.nixpkgs = {
        input = unstable;
        config = {
          allowUnfree = true;
        };
      };

      channels.master = {
        input = master;
        config = {
          allowUnfree = true;
        };
      };

      channels.nixpkgs-stable = {
        input = stable;
        config = {
          allowUnfree = true;
        };
      };

      channels.nixpkgs.overlaysBuilder = channels: [
        (final: prev: { inherit (channels) wamnr; })
      ];

      hosts = {
        nixos = {
          modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.useGlobalPkgs = true;
            }
             ({ pkgs, ... }: {
              home-manager.users.mbpnix = { ... }: { imports = [ ./home/home.nix ]; };
              environment.shellAliases = {
                nix-repl = "nix repl ${inputs.utils.lib.repl}";
              };
            })
          ];
        };
      };

      sharedOverlays = [
        nur.overlay
        self.overlay
      ];

      overlay = import ./system/overlays/packages.nix;

      hostDefaults.modules = [ utils.nixosModules.saneFlakeDefaults ];
    };
}
