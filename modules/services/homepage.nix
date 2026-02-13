{ config, pkgs, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;

    # TODO: Permitir Apenas os Meus Hosts
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
        "Media" = [
          {
            "Jellyfin" = {
              href = "http://192.168.1.95:8096";
              icon = "jellyfin";
              description = "Servidor de streaming";
              widget = {
                type = "jellyfin";
                url = "http://192.168.1.95:8096";
              };
            };
          }
          {
            "Navidrome" = {
              href = "http://192.168.1.95:4533";
              icon = "navidrome";
              description = "Servidor de música";
            };
          }
        ];
      }

      # ---- Secção Downloads ----
      {
        "Downloads" = [
          {
            "qBittorrent" = {
              href = "http://192.168.1.10:8080";
              icon = "qbittorrent";
              widget = {
                type = "qbittorrent";
                url = "http://192.168.1.10:8080";
                username = "admin";
                password = "adminadmin";
              };
            };
          }
        ];
      }

      # ---- Secção Sistema ----
      {
        "Sistema" = [
          {
            "NixOS" = {
              icon = "nixos";
              description = "Gestão do sistema";
              href = "https://search.nixos.org";
            };
          }
          {
            "Cockpit" = {
              href = "http://192.168.1.10:9090";
              icon = "server";
              description = "Administração do servidor";
            };
          }
        ];
      }

      # ---- Secção Utilitários ----
      {
        "Utilitários" = [
          {
            "Portainer" = {
              href = "http://192.168.1.10:9443";
              icon = "portainer";
              description = "Gestão de containers";
            };
          }
          {
            "Grafana" = {
              href = "http://192.168.1.10:3000";
              icon = "grafana";
              description = "Dashboards avançados";
            };
          }
        ];
      }
    ];

    bookmarks = [
      {
        "Favoritos" = [
          {
            "GitHub" = {
              href = "https://github.com";
              icon = "github";
            };
          }
          {
            "NixOS Wiki" = {
              href = "https://wiki.nixos.org";
              icon = "nixos";
            };
          }
        ];
      }
    ];
  };
}
