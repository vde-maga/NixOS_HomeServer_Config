{ config, pkgs, pkgs-unstable, ... }:

{
  services.navidrome = {
    enable = true;
    package = pkgs-unstable.navidrome;
    openFirewall = true;
    settings = {
      EnableInsightsCollector = true;
      Port = 4533;
      Address = "0.0.0.0";
      ScanSchedule = "@every 1h";
      BaseURL = "/music/";
      #MusicFolder = "/media/music";
    };
  };
}
