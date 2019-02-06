# tmux.pl --- TMUX installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/utils/installer/lib";
use Install::PathResolver;

if (&is_macos) {
    brew_install('tmux');
    brew_install('reattach-to-user-namespace');
}
elsif (&is_arch) {
    pacman_sync('tmux');
}

if ( &is_macos or &is_arch ) {
    git_clone(
        'https://github.com/tmux-plugins/tpm.git',
        "${ENV{HOME}}/.tmux/plugins/tpm"
    );

    ln( dotfile('tmux/tmux.conf'), "${ENV{HOME}}/.tmux.conf" );

    # Install terminfo files
    tic( dotfile('terminfo/screen-256color-italic.ti') );
}

1;
