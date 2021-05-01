{ config, home-manager, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.gammastep;
in {
  options.modules.desktop.gammastep = with types; { enable = mkBoolOpt false; };

  config = mkIf cfg.enable {
    home-manager.users.${config.user.name}.services = {
      gammastep = {
        enable = true;
        latitude = "35.41";
        longitude = "139.41";
        temperature = {
          day = 5500;
          night = 5500;
        };
      };
    };
  };
}