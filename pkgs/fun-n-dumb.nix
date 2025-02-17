{pkgs, options, config, ...}: {
  options = {};
  config = {
    environment.systemPackages = with pkgs; [
      cmatrix
      cowsay
      cool-retro-term
      hollywood
    ];
  };

}
