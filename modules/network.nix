{ config, pkgs, ... }:

let
  vars = import ../variables.nix;
in
{

  networking = {
    hostName = vars.hostname;
    #useDHCP = false;
    networkmanager.enable = true;

    # interfaces.${vars.interface} = {
    #   ipv4.addresses = [{
    #     address = vars.ip;
    #     prefixLength = 24;
    #   }];
    # };

    #defaultGateway = vars.default_gateway;

    firewall = {
      enable = true;

      allowedTCPPorts = [
        22 # SSH
        8096 # Jellyfin
        443
      ];

      allowedUDPPorts = [
        1900 # Jellyfin DLNA
        7359 # Jellyfin discovery
      ];
      allowPing = true;
      checkReversePath = false;
    };
  };
}
