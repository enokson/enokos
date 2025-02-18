{pkgs, options, config, ...}: {
  options = {};
  config = {
    environment.systemPackages = with pkgs; [
      gimp
      inkscape
      keymapp # app for zsa keyboards
      img2pdf
      kdePackages.okular
      libreoffice-qt
      signal-desktop
      sparrow
      telegram-desktop
      # TODO: add as a service
      # stirling-pdf  
      pdfsam-basic # pdf editor
      qbittorrent # torrent downloader
      toipe # typing practice
      tor-browser-bundle-bin
      ueberzugpp # for use with yazi

      # wine
      winePackages.waylandFull
      wine
      winetricks
      bottles

      kitty
    ];
  };

}
