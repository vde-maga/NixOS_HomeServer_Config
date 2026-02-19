{ config, pkgs, ... }:

let
  vars = import ../variables.nix;
in
{
  users.groups = {
    media = { };
  };

  users.users.${vars.username} = {
    isNormalUser = true;
    description = "Admin";
    extraGroups = [
      "wheel" # sudo
      "media"
    ];
    #openssh.authorizedKeys.keys = vars.ssh_keys;
    shell = pkgs.bash;
  };
  users.users.root = {
    hashedPassword = "!";
  };
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
    # wheelNeedsPassword = false;
  };
}
