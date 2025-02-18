{pkgs, options, config, ...}: {
  options = {};
  config = {
    environment.systemPackages = with pkgs; [
      git
      ncdu # for disk space utility
      tldr
      lshw pciutils
      wget curl
      zip unzip gzip
      htop
      tmux # multiplexor
      fzf # fuzzy finder
      zoxide # cd alt
      bat # cat alt
      overskride #bluetooth
      just # task builder/runner
      fastfetch # get systeminfo
      lazygit
      lazydocker
      yazi
      glow # md viewer
      tailscale
      protonvpn-cli_2
      hunspell # spell checker
      hunspellDicts.en_US
      nh nix-output-monitor nvd # nix related
      openvpn
      eza # ls replacement
      fzf # fuzzy finding
      zoxide # cd replacement
      kitty # terminal emulator
    ];
    services.tailscale.enable = true;
    programs.openvpn3.enable = true;
  };

}
