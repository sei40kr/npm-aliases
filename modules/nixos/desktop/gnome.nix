{ config, lib, pkgs, ... }:

with lib;
with lib.my;
let
  cfg = config.modules.desktop.gnome;
  themeType = with types;
    submodule {
      options = {
        package = mkOpt package null;
        name = mkOpt str null;
      };
    };

  extensionPackages = cfg.extensions.packages ++ (optionals (cfg.theme != null)
    (with pkgs; [ gnomeExtensions.user-themes ]));
  extensionNames = cfg.extensions.names ++ (optionals (cfg.theme != null)
    [ "user-theme@gnome-shell-extensions.gcampax.github.com" ]);
in {
  options.modules.desktop.gnome = with types; {
    enable = mkBoolOpt false;
    extensions = {
      packages = mkOpt (listOf package) [ ];
      names = mkOpt (listOf str) [ ];
    };
    theme = mkOpt (nullOr themeType) null;
  };

  config = mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
      gnome.core-utilities.enable = false;
    };
    environment.gnome.excludePackages = with pkgs; [ gnome.gnome-terminal ];
    networking.networkmanager.packages = with pkgs;
      [ gnome.networkmanager-openvpn ];

    user.packages = with pkgs;
      [
        # GNOME core utilities
        gnome.gnome-calculator
        gnome.gnome-screenshot

        # GNOME core developer tools
        gnome.dconf-editor
        gnome.gnome-tweaks
      ] ++ extensionPackages
      ++ (optionals (cfg.theme != null) [ cfg.theme.package ]);

    modules = {
      desktop = {
        fcitx5.enable = true;
        dconf = {
          enable = true;
          settings = {
            "org/gnome/desktop/interface".enable-animations = false;
            "org/gnome/desktop/peripherals/keyboard" = {
              delay = 150;
              repeat-interval = 30;
            };
            "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
            "org/gnome/shell".enabled-extensions = extensionNames;
            "org/gnome/shell/extensions/user-theme".name =
              mkIf (cfg.theme != null) cfg.theme.name;
          };
        };
        fontconfig.enable = true;
        gnome.theme = {
          package = pkgs.materia-theme;
          name = "Materia-dark";
        };
        gtk = {
          enable = true;
          font = {
            package = pkgs.roboto;
            name = "sans-serif";
            size = 11;
          };
          theme = {
            theme = {
              package = pkgs.materia-theme;
              name = "Materia-dark";
            };
            iconTheme = {
              package = pkgs.papirus-icon-theme;
              name = "Papirus";
            };
          };
        };
      };
      editors.fonts = {
        code = {
          family = "monospace";
          size = 13;
        };
        ui.size = 12;
      };
      term = {
        font = {
          name = "monospace";
          size = 13;
        };
        theme.colorscheme = "doom-one";
      };
    };
  };
}
