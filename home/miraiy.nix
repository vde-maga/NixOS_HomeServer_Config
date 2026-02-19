{ config, pkgs, vars, ... }:

{
  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";
  home.stateVersion = "25.11";

  programs = {
    home-manager.enable = true;

    # Git
    git = {
      enable = true;
      settings = {
        user.name = vars.username;
        # user.email = "teu@email.com";
      };
    };

    # Bash com aliases úteis para o servidor
    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -la";
        la = "ls -A";
        l = "ls -CF";
        
        # NixOS
        update = "sudo nixos-rebuild switch --flake /etc/nixos#${vars.hostname}";
        update-dry = "sudo nixos-rebuild dry-run --flake /etc/nixos#${vars.hostname}";
        flake-update = "sudo nix flake update --flake /etc/nixos";
        cleanup = "sudo nix-collect-garbage -d";
        
        # Serviços
        logs = "journalctl -xef";
        services = "systemctl list-units --type=service --state=running";
      };
    };
  };

  # Se quiseres ficheiros de configuração específicos
  # home.file.".config/exemplo/config" = {
  #   text = ''
  #     configuração aqui
  #   '';
  # };
}