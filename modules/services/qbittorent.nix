{ config, pkgs, ... }:

{
  services.qbittorrent = {
    enable = true;
    openFirewall = true; # Abre webuiPort + torrentingPort automaticamente
    webuiPort = 8080;
    torrentingPort = 6881;
    serverConfig = {
      LegalNotice.Accepted = true;
      Preferences = {
        General.Locale = "pt";
        #Downloads = {
        #  SavePath = "${vars.storagePath}/downloads/torrents";
        #  TempPath = "${vars.storagePath}/downloads/torrents/incomplete";
        #  TempPathEnabled = true;
        #};
      };
      #BitTorrent.Session = {
      #  DefaultSavePath = "${vars.storagePath}/downloads/torrents";
      #  Port = 6881;
      #};
    };
  };
}
