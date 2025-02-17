{
  description = "Enokos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let 
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    lib = nixpkgs.lib;
  in {

    nixosModules.utils = { config, options, ... }: {
      imports = [ ./pkgs/utils.nix ];
    };

    #nixosModules.hyprland = { config, options }: {
    #  options.hypr.enable = lib.mkEnableOption;
    #  config = lib.mkIf config.hypr.enable {
    #    modules = [];
    #  };
    #};
  };
}
