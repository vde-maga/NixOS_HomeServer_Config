{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      #KbdInteractiveAuthentication = false;
      #PermitRootLogin = "no";
      #X11Forwarding = false;
      #MaxAuthTries = 3;
      #LoginGraceTime = 20;
      #ClientAliveInterval = 300;
      #ClientAliveCountMax = 2;
    };
  };
}
