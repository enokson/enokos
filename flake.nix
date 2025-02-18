{
  description = "Enokos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    #nixvim.url = "github:nix-community/nixvim";
    #nixvim.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let 
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    lib = nixpkgs.lib;
  in {

    nixosModules.utils = { config, options, ... }: {
      imports = [ ./pkgs/utils.nix ];
    };

    nixosModules.theme = import ./theme/theme.nix {inherit inputs;};

    #nixosModules.neovim = { config, options, ... }: {
    #  imports = [ 
    #    inputs.nixvim.nixosModules.nixvim
    #    ./apps/nixvim/nixvim.nixvim
    #  ];
    #};

  };
}
