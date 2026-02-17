{ config, pkgs, ... }:

{
  services.slskd = {
    enable = true;

    # Pacote padrão do NixOS
    package = pkgs.slskd;

    # Utilizador e grupo dedicados
    user = "slskd";
    group = "slskd";

    # Não abrir firewall — apenas uso local
    openFirewall = false;
    domain = "localhost";

    # Ficheiro opcional para credenciais (username/password do Soulseek)
    #environmentFile = "/var/lib/slskd/credentials.env";
    environmentFile = "null";

    settings = {
      # Configuração da interface web
      web = {
        url_base = "/";
        port = 5030;
        https.disabled = true;
      };

      # Configuração Soulseek
      soulseek = {
        listen_port = 5031;
        description = "Homeserver Soulseek";
      };

      # Diretórios de partilha
      #shares.directories = [
      #  "/srv/media/music"
      #];

      # Diretórios de downloads
      #directories = {
      #  incomplete = "/srv/slsk/incomplete";
      #  downloads  = "/srv/slsk/downloads";
      #};

      # Filtros opcionais (exemplo: ignorar ficheiros temporários)
      shares.filters = [
        "*.tmp"
        "*.part"
      ];

      # Rooms automáticas (opcional)
      rooms = [ ];

      # Retenção mínima para não acumular lixo
      retention = {
        transfers = {
          upload = {
            succeeded = 7;
            errored = 3;
            cancelled = 3;
          };
          download = {
            succeeded = 7;
            errored = 3;
            cancelled = 3;
          };
        };
        files = {
          incomplete = 14;
          complete = 30;
        };
      };

      # Gestão remota de ficheiros (mantido simples)
      remote_file_management = false;

      # Limites globais (ajusta conforme a tua ligação)
      global = {
        upload = {
          speed_limit = 0; # 0 = ilimitado
          slots = 3;
        };
        download = {
          speed_limit = 0;
          slots = 4;
        };
      };

      # Forçar scan inicial das partilhas
      flags.force_share_scan = true;

      # Filtros de pesquisa (exemplo: bloquear pedidos suspeitos)
      filters.search.request = [ ];

    };

    # nginx desativado por padrão
    nginx = {
      enableACME = false;
      default = false;
      # Se quiseres expor a interface web:
      # serverName = "slskd.local";
      # listenAddresses = [ "0.0.0.0" ];
      # locations."/".proxyPass = "http://127.0.0.1:5030";
    };
  };

  # Criar utilizador/grupo
  users.users.slskd = {
    isSystemUser = true;
    group = "slskd";
    home = "/var/lib/slskd";
    createHome = true;
  };

  users.groups.slskd = { };
}
