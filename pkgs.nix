{ config, pkgs, lib, ... }: let
  flavors = lib.types.enum [ "server" "full" "minimal" "all" ];
  server-apps = with pkgs; [];
  minimal-apps = with pkgs; [];
  full-apps = with pkgs; [];
  extra-apps = with pkgs; [
    toipe
  ];
  in {
    options.pkgs.flavors = lib.mkOption {
      description = "Determine if to install the full or minimal pkgs";
      type = lib.types.listOf flavors;
      default = "full";
    };
    config = {
    environment.systemPackages = 
      lib.optionals (lib.elem "server" config.pkgs.flavors) server-apps
      ++ lib.optionals (lib.elem "minimal" config.pkgs.flavors) minimal-apps
      ++ lib.optionals (lib.elem "full" config.pkgs.flavors) full-apps
      ++ lib.optionals (lib.elem "extra" config.pkgs.flavors) extra-apps
      ++ lib.optionals (lib.elem "all" config.pkgs.flavors) (
        server-apps ++ minimal-apps ++ full-apps ++ extra-apps
      );
    };
}
