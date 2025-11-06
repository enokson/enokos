{
  description = "Enokos";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixvim.url = "github:nix-community/nixvim";
    # nixvim.inputs.nixpkgs.follows = "nixpkgs";
    # stylix.url = "github:danth/stylix";
    # stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... } @ inputs: let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
    lib = nixpkgs.lib;
  in {

    nixosConfigurations.enokos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "${system}";
      modules = [
        ./hardware-configuration.nix
        self.nixosModules.enokos-full
        #inputs.home-manager.nixosModules.default
        #inputs.nixvim.nixosModules.nixvim
        #inputs.stylix.nixosModules.stylix
        {
          boot.loader = {
            efi.canTouchEfiVariables = true;
            grub = {
              enable = true;
              devices = [ "nodev" ];
              efiSupport = true;
              useOSProber = true;
            };
          };
          boot.tmp.useTmpfs = true;
        }
      ];
    };
    
    nixosModules.enokos-full = import ./enokos-full.nix;
    nixosModules.zsh = ./shells/zsh.nix;

  };
}
