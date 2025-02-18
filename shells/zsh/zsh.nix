{ pkgs, ... }: {
  config = {
    environment.shells = with pkgs; [ zsh ];
    programs.zsh.enable = true;
  };
}
