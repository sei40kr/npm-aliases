{ config, lib, options, pkgs, ... }:

with lib; {
  options.modules.dev.java.enable = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf config.modules.dev.java.enable {
    modules.dev.tools = {
      jenv.enable = mkForce true;
      maven.enable = mkForce true;
      gradle.enable = mkForce true;
      springBoot.enable = mkForce true;
    };

    my.packages = with pkgs; [ jdk11 ];
  };
}
