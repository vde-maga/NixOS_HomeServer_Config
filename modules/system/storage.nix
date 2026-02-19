{ config, pkgs, vars, ... }:

{
  # Criar pastas de media
  #systemd.tmpfiles.rules = [
  #  "d /media 0755 root root -"
  #  "d /media/movies 0775 root media -"
  #  "d /media/tv 0775 root media -"
  #  "d /media/music 0775 root media -"
  #  "d /media/downloads 0775 root media -"
  #  "d /media/torrents 0775 root media -"
  #];

  # Montar discos externos (exemplo - ajusta ao teu caso)
  # fileSystems."/media/storage" = {
  #   device = "/dev/disk/by-uuid/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX";
  #   fsType = "ext4";
  #   options = [ "nofail" "x-systemd.automount" ];
  # };

  # Pacotes úteis para storage
  environment.systemPackages = with pkgs; [
    parted
    gptfdisk
    ntfs3g
    exfatprogs
  ];
}