{ pkgs, lib, config, ... }: {
  options = {
    zsh.enable = lib.mkEnableOption "enables the zsh option";
  };
  config = lib.mkIf config.zsh.enable {
    environment.shells = with pkgs; [ zsh ];
    environment.systemPackages = with pkgs; [
      eza
      fzf
      tmux
      zoxide
      kitty
    ];
    programs.zsh.enable = true;
  };
}
