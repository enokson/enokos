{pkgs, options, config, ...}: {
  options = {};
  config = {
    environment.systemPackages = with pkgs; [
      gparted # gnome.gnome-disk-utility
      brave
      mupdf
      kdePackages.dolphin
      remmina
    ];
  };

}
