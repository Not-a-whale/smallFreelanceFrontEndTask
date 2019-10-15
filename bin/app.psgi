#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use TMS::Transport::Dancer::TMS;

TMS::Transport::Dancer::TMS->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use TMS;
use Plack::Builder;

builder {
    enable 'Deflater';
    TMS->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use TMS;
use TMS_admin;

use Plack::Builder;

builder {
    mount '/'      => TMS->to_app;
    mount '/admin'      => TMS_admin->to_app;
}

=end comment

=cut

