{ config, pkgs, vars, ... }:

{
  services.nginx = {
    enable = true;
    
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;

    virtualHosts."_" = {
      default = true;
      locations = {
        # Jellyfin
        "/jellyfin/" = {
          proxyPass = "http://127.0.0.1:8096/";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_buffering off;
          '';
        };

        # Navidrome
        "/music/" = {
          proxyPass = "http://127.0.0.1:4533/";
        };

        # qBittorrent
        "/torrent/" = {
          proxyPass = "http://127.0.0.1:8080/";
        };

        # Homepage (raiz)
        "/" = {
          proxyPass = "http://127.0.0.1:8082/";
        };

        # Soulseek
        #"/soulseek/" = {
        #  proxyPass = "http://127.0.0.1:5030/soulseek/";
        #  proxyWebsockets = true;
        #};
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}