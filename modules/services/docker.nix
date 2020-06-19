{ config, lib, options, pkgs, ... }:

with lib;
let cfg = config.modules.services.docker;
in {
  options.modules.services.docker = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    enableAutoPrune = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = cfg.enableAutoPrune;
    };
  };
}