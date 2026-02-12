{ config, pkgs, ... }:

let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) {
    config.allowUnfree = true;
  };
in {
  services.navidrome = {
	enable = true;
	package = unstable.navidrome;
	openFirewall = true;
        settings = {
                EnableInsightsCollector = true;
		Port = 4533;
		Address = "0.0.0.0";
		ScanSchedule = "@every 1h";
		#MusicFolder = "/media/music";
        };
  };
}

