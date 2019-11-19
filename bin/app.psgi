#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use TMS::Transport::Dancer::TMS;
TMS::Transport::Dancer::TMS->to_app;
