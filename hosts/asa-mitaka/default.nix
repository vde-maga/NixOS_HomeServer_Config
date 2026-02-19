{ config, pkgs, vars, ... }:

{
  imports = [
    ./hardware-configuration.nix
    
    # Módulos do sistema
    ../../modules/system/locale.nix
    ../../modules/system/network.nix
    ../../modules/system/security.nix
    ../../modules/system/users.nix
    
    # Serviços
    ../../modules/services/jellyfin.nix
    ../../modules/services/navidrome.nix
    ../../modules/services/homepage.nix
    ../../modules/services/qbittorent.nix
    #../../modules/services/soulseek.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nix settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Pacotes de sistema (ferramentas de admin)
  environment.systemPackages = with pkgs; [
    # Editores
    vim
    
    # Rede
    wget
    curl
    iftop
    
    # Sistema
    htop
    btop
    iotop
    ncdu
    tree
    lsof
    smartmontools
    
    # Ficheiros
    unzip
    p7zip
    
    # Nix
    alejandra
    nixd
    nixfmt
    
    # Outros
    git
    fastfetch
  ];

  system.stateVersion = "25.11";
}