{options, config, lib}: {
  options = {
    theming = {
      enable = lib.mkEnableOption;
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
    }
  };
}
