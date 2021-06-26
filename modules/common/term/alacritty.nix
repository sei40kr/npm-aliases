{ config, lib, pkgs, ... }:

with lib;
with lib.my;
let
  termCfg = config.modules.term;
  cfg = termCfg.alacritty;
  colors = termCfg.theme.colors;
in {
  options.modules.term.alacritty.enable = mkBoolOpt false;

  config = mkIf cfg.enable {
    home-manager.users.${config.user.name}.programs.alacritty = {
      enable = true;
      package = pkgs.my.alacritty;
      settings = {
        # Any items in the `env` entry below will be added as
        # environment variables. Some entries may override variables
        # set by alacritty itself.
        env = {
          # TERM variable
          #
          # This value is used to set the `$TERM` environment variable for
          # each instance of Alacritty. If it is not present, alacritty will
          # check the local terminfo database and use `alacritty` if it is
          # available, otherwise `xterm-256color` is used.
          TERM = "alacritty";

          LANG = "en_US.UTF-8";
          LC_CTYPE = "ja_JP.UTF-8";
        };

        scrolling = {
          # Maximum number of lines in the scrollback buffer.
          # Specifying '0' will disable scrolling.
          # history = 10000;
        };

        # Font configuration
        font = {
          # Normal (roman) font face
          normal = {
            # Font family
            #
            # Default:
            #   - (macOS) Menlo
            #   - (Linux/BSD) monospace
            #   - (Windows) Consolas
            family = termCfg.font.name;

            # The `style` can be specified to pick a specific face.
            # style = "Regular";
          };

          # Point size
          inherit (termCfg.font) size;
        };

        # Thin stroke font rendering (macOS only)
        #
        # Thin strokes are suitable for retina displays, but for non-retina screens
        # it is recommended to set `use_thin_strokes` to `false`.
        use_thin_strokes = true;

        # If `true`, bold text is drawn using the bright color variants.
        # draw_bold_text_with_bright_colors = false;

        # Colors
        colors = {
          # Default colors
          primary = {
            background = colors.bg;
            foreground = colors.fg;
          };

          # Cursor colors
          #
          # Colors which should be used to draw the terminal cursor.
          #
          # Allowed values are CellForeground/CellBackground, which reference the
          # affected cell, or hexadecimal colors like #ff00ff.
          cursor = { inherit (colors) cursor; };

          # Normal colors
          normal = {
            inherit (colors) black red green yellow blue magenta cyan white;
          };

          # Bright colors
          bright = {
            inherit (colors) black red green yellow blue magenta cyan white;
          };
        };

        # Key bindings
        #
        # Key bindings are specified as a list of objects.
        key_bindings = [
          # A workaround to remap option as Meta (macOS only)
          # https://github.com/alacritty/alacritty/issues/62
          {
            key = "A";
            mods = "Alt";
            chars = "\\x1ba";
          }
          {
            key = "B";
            mods = "Alt";
            chars = "\\x1bb";
          }
          {
            key = "C";
            mods = "Alt";
            chars = "\\x1bc";
          }
          {
            key = "D";
            mods = "Alt";
            chars = "\\x1bd";
          }
          {
            key = "E";
            mods = "Alt";
            chars = "\\x1be";
          }
          {
            key = "F";
            mods = "Alt";
            chars = "\\x1bf";
          }
          {
            key = "G";
            mods = "Alt";
            chars = "\\x1bg";
          }
          {
            key = "H";
            mods = "Alt";
            chars = "\\x1bh";
          }
          {
            key = "I";
            mods = "Alt";
            chars = "\\x1bi";
          }
          {
            key = "J";
            mods = "Alt";
            chars = "\\x1bj";
          }
          {
            key = "K";
            mods = "Alt";
            chars = "\\x1bk";
          }
          {
            key = "L";
            mods = "Alt";
            chars = "\\x1bl";
          }
          {
            key = "M";
            mods = "Alt";
            chars = "\\x1bm";
          }
          {
            key = "N";
            mods = "Alt";
            chars = "\\x1bn";
          }
          {
            key = "O";
            mods = "Alt";
            chars = "\\x1bo";
          }
          {
            key = "P";
            mods = "Alt";
            chars = "\\x1bp";
          }
          {
            key = "Q";
            mods = "Alt";
            chars = "\\x1bq";
          }
          {
            key = "R";
            mods = "Alt";
            chars = "\\x1br";
          }
          {
            key = "S";
            mods = "Alt";
            chars = "\\x1bs";
          }
          {
            key = "T";
            mods = "Alt";
            chars = "\\x1bt";
          }
          {
            key = "U";
            mods = "Alt";
            chars = "\\x1bu";
          }
          {
            key = "V";
            mods = "Alt";
            chars = "\\x1bv";
          }
          {
            key = "W";
            mods = "Alt";
            chars = "\\x1bw";
          }
          {
            key = "X";
            mods = "Alt";
            chars = "\\x1bx";
          }
          {
            key = "Y";
            mods = "Alt";
            chars = "\\x1by";
          }
          {
            key = "Z";
            mods = "Alt";
            chars = "\\x1bz";
          }
          {
            key = "A";
            mods = "Alt|Shift";
            chars = "\\x1bA";
          }
          {
            key = "B";
            mods = "Alt|Shift";
            chars = "\\x1bB";
          }
          {
            key = "C";
            mods = "Alt|Shift";
            chars = "\\x1bC";
          }
          {
            key = "D";
            mods = "Alt|Shift";
            chars = "\\x1bD";
          }
          {
            key = "E";
            mods = "Alt|Shift";
            chars = "\\x1bE";
          }
          {
            key = "F";
            mods = "Alt|Shift";
            chars = "\\x1bF";
          }
          {
            key = "G";
            mods = "Alt|Shift";
            chars = "\\x1bG";
          }
          {
            key = "H";
            mods = "Alt|Shift";
            chars = "\\x1bH";
          }
          {
            key = "I";
            mods = "Alt|Shift";
            chars = "\\x1bI";
          }
          {
            key = "J";
            mods = "Alt|Shift";
            chars = "\\x1bJ";
          }
          {
            key = "K";
            mods = "Alt|Shift";
            chars = "\\x1bK";
          }
          {
            key = "L";
            mods = "Alt|Shift";
            chars = "\\x1bL";
          }
          {
            key = "M";
            mods = "Alt|Shift";
            chars = "\\x1bM";
          }
          {
            key = "N";
            mods = "Alt|Shift";
            chars = "\\x1bN";
          }
          {
            key = "O";
            mods = "Alt|Shift";
            chars = "\\x1bO";
          }
          {
            key = "P";
            mods = "Alt|Shift";
            chars = "\\x1bP";
          }
          {
            key = "Q";
            mods = "Alt|Shift";
            chars = "\\x1bQ";
          }
          {
            key = "R";
            mods = "Alt|Shift";
            chars = "\\x1bR";
          }
          {
            key = "S";
            mods = "Alt|Shift";
            chars = "\\x1bS";
          }
          {
            key = "T";
            mods = "Alt|Shift";
            chars = "\\x1bT";
          }
          {
            key = "U";
            mods = "Alt|Shift";
            chars = "\\x1bU";
          }
          {
            key = "V";
            mods = "Alt|Shift";
            chars = "\\x1bV";
          }
          {
            key = "W";
            mods = "Alt|Shift";
            chars = "\\x1bW";
          }
          {
            key = "X";
            mods = "Alt|Shift";
            chars = "\\x1bX";
          }
          {
            key = "Y";
            mods = "Alt|Shift";
            chars = "\\x1bY";
          }
          {
            key = "Z";
            mods = "Alt|Shift";
            chars = "\\x1bZ";
          }
          {
            key = "Key1";
            mods = "Alt";
            chars = "\\x1b1";
          }
          {
            key = "Key2";
            mods = "Alt";
            chars = "\\x1b2";
          }
          {
            key = "Key3";
            mods = "Alt";
            chars = "\\x1b3";
          }
          {
            key = "Key4";
            mods = "Alt";
            chars = "\\x1b4";
          }
          {
            key = "Key5";
            mods = "Alt";
            chars = "\\x1b5";
          }
          {
            key = "Key6";
            mods = "Alt";
            chars = "\\x1b6";
          }
          {
            key = "Key7";
            mods = "Alt";
            chars = "\\x1b7";
          }
          {
            key = "Key8";
            mods = "Alt";
            chars = "\\x1b8";
          }
          {
            key = "Key9";
            mods = "Alt";
            chars = "\\x1b9";
          }
          {
            key = "Key0";
            mods = "Alt";
            chars = "\\x1b0";
          }
          # Ctrl + Space
          {
            key = "Space";
            mods = "Control";
            chars = "\\x00";
          }
          # Alt + `
          {
            key = "Grave";
            mods = "Alt";
            chars = "\\x1b`";
          }
          # Alt + ~
          {
            key = "Grave";
            mods = "Alt|Shift";
            chars = "\\x1b~";
          }
          # Alt + .
          {
            key = "Period";
            mods = "Alt";
            chars = "\\x1b.";
          }
          # Alt + *
          {
            key = "Key8";
            mods = "Alt|Shift";
            chars = "\\x1b*";
          }
          # Alt + #
          {
            key = "Key3";
            mods = "Alt|Shift";
            chars = "\\x1b#";
          }
          # Alt + >
          {
            key = "Period";
            mods = "Alt|Shift";
            chars = "\\x1b>";
          }
          # Alt + <
          {
            key = "Comma";
            mods = "Alt|Shift";
            chars = "\\x1b<";
          } # Alt + _
          {
            key = "Minus";
            mods = "Alt|Shift";
            chars = "\\x1b_";
          }
          # Alt + %
          {
            key = "Key5";
            mods = "Alt|Shift";
            chars = "\\x1b%";
          }
          # Alt + ^
          {
            key = "Key6";
            mods = "Alt|Shift";
            chars = "\\x1b^";
          }
          # Alt + \
          {
            key = "Backslash";
            mods = "Alt";
            chars = "\\x1b\\\\";
          }
          # Alt + |
          {
            key = "Backslash";
            mods = "Alt|Shift";
            chars = "\\x1b|";
          }
        ];
      };
    };
  };
}
