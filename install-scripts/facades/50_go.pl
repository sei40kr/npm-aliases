# 50_go.pl --- go facade
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

my @go_get_intermediate = ();

sub go_get {
    my $pkg = $_[0];

    push( @go_get_intermediate, $pkg );
}

my sub go_get_reducer {
    return if ( scalar(@go_get_intermediate) eq 0 );

    is_exec('go') or error('go not found.');

    log_wait('Installing Go packages ...');

    my @cmd = qw(go get);
    push( @cmd, '-u' ) if (&do_update);
    run_cmd(@cmd);
}

1;