{ config, lib, options, pkgs, ... }:

{
  my.userName = "sei40kr";
  my.user = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "video" "networkmanager" ];
    shell = pkgs.zsh;
  };

  modules = {
    system.fstrim.enable = true;

    desktop = {
      xmonad.enable = true;

      apps = {
        webBrowsers = {
          chromium.enable = true;
          qutebrowser.enable = true;
        };
        slack.enable = true;
        deluge = {
          enable = true;
          enableWebUI = true;
        };
        rofi.enable = true;
        thunar.enable = true;
      };

      term.alacritty.enable = true;
      tools.psd.enable = true;
      i18n.japanese.enable = true;
    };

    dev = {
      editors = {
        emacs.enable = true;
        idea.enable = true;
      };

      tools = {
        git = {
          enable = true;
          enableGitFlow = true;
          enableGitCrypt = true;
        };

        awsShell.enable = true;
        googleCloudSdk.enable = true;
        circleciCli.enable = true;
        travis.enable = true;

        zeal.enable = true;
      };

      cc.enable = true;
      go.enable = true;
      groovy.enable = true;
      haskell.enable = true;
      java.enable = true;
      kotlin.enable = true;
      python.enable = true;
      r.enable = true;
      ruby = {
        enable = true;
        enableRails = true;
      };
      rust.enable = true;
      scala.enable = true;
      sh.enable = true;
      web.enable = true;
    };

    shell = {
      zsh.enable = true;
      tmux.enable = true;

      tools = {
        sshd.enable = true;

        bat.enable = true;
        exa.enable = true;
        flexget.enable = true;
        htop.enable = true;
        strace.enable = true;
        tcpdump.enable = true;
      };
    };
  };
}