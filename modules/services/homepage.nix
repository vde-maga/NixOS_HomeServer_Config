{ config, pkgs, vars, ... }:

{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;

    # TODO: Apenas Permitir Local Hosts e Não Tudo
    allowedHosts = "*";

    settings = {
      port = 8082;
      title = "Deadlock";
      #theme = "dark";
      #color = "slate";
      layout = "auto";
      showStats = true;
    };

    widgets = [
      # ---- Widgets de Sistema ----
      {
        resources = {
          cpu = true;
          memory = true;
          disk = "/";
          uptime = true;
        };
      }

      # ---- Meteo ----
      {
        openmeteo = {
          label = "Famalicão";
          latitude = 41.407;
          longitude = -8.519;
          units = "metric";
        };
      }

      # ---- Relógio Mundial ----
      {
        datetime = {
          format = "dddd, DD MMMM YYYY - HH:mm";
          timezone = "Europe/Lisbon";
        };
      }
    ];

    services = [
      # ---- Secção Media ----
      {
        "High Art, Lost Media" = [
          {
            "Jellyfin" = {
              href = "http://${vars.local_ip}:8096";
              icon = "jellyfin";
              description = "Mostrar às Gasosas o Netfix de Chad!";
              widget = {
                type = "jellyfin";
                url = "http://${vars.local_ip}:8096";
              };
            };
          }
          {
            "Navidrome" = {
              href = "http://${vars.local_ip}:4533";
              icon = "navidrome";
              description = "Eu no Metro do Porto a Ouvir Slowdive";
            };
          }
        ];
      }

      # ---- Secção Downloads ----
      {
        "Steam Verde" = [
          {
            "qBittorrent" = {
              href = "http://${vars.local_ip}:8080";
              icon = "qbittorrent";
              description = "Pirataria da Brava";
              widget = {
                type = "qbittorrent";
                url = "http://${vars.local_ip}:8080";
                #username = "admin";
                #password = "adminadmin";
              };
            };
          }
          {
            "Soulseek" = {
              href = "http://${vars.local_ip}:5030";
              icon = "soulseek";
              description = "Record Store, com descontos bombásticos";
            };
          }
        ];
      }
    ];
  };
}
