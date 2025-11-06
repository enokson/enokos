{ self, config, inputs, ... }: {
  imports = [
    ./pkgs.nix
    #./shells/zsh.nix
  ];
  config = {
    pkgs.flavors = ["all"];
    #zsh.enable = true;
  };
}
