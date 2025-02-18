{ inputs, ... }: { pkgs, config, lib, ... }: {
  imports = [ inputs.stylix.nixosModules.stylix ];
  options = {
    theming = {
      theme = lib.mkOption {
        type = lib.types.str;
        default = "catppuccin-mocha";
      };
      cursor = {
        pgk = lib.mkOption {
          type = lib.types.package;
          default = pkgs.bibata-cursors;
        };
        name = lib.mkOption {
          type = lib.types.str;
          default = "Bibata-Modern-Ice";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 36;
        };
      };
    };
  };
  config = { 
    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${config.theming.theme}.yaml";
    stylix.image = ./1123121.png;
    stylix.cursor.package = config.theming.cursor.pkg;
    stylix.cursor.name = config.theming.cursor.name;
    stylix.cursor.size = config.theming.cursor.size;
  };
}
