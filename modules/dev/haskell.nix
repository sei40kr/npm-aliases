{ config, lib, pkgs, ... }:

with lib; {
  options.modules.dev.haskell.enable = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf config.modules.dev.haskell.enable {
    my.packages = with pkgs; [ ghc stack ];

    my.home.home.file.".stack/config.yaml".text = ''
      templates:
        params:
          author-email: ${config.my.userEmail}
          author-name: ${config.my.userName}
          copyright: 'Copyright (c) 2020 ${config.my.userName}'
          github-username: sei40kr
    '';

    modules.shell.zsh.zinitPluginsInit = ''
      zinit ice wait'''
      zinit snippet OMZP::stack/stack.plugin.zsh
      zinit ice wait'''
      zinit snippet OMZP::cabal/cabal.plugin.zsh
    '';
  };
}
