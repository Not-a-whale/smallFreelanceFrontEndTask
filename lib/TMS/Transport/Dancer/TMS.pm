package TMS::Transport::Dancer::TMS;

use strict;
use warnings;

use Dancer2;
use Dancer2::Logger::File;
use File::Find;
use FindBin;
use Cwd 'abs_path';

set session => 'Simple';
set engines => {
    serializer => {
        JSON => {
            allow_nonref => 1,
            indent       => 1,
            space_after  => 1,
            space_before => 1
        }
    }
};

set serializer   => 'JSON';
set content_type => 'application/json';

our $VERSION = '3.1';

get '/' => sub {
    send_as 'html' => send_file '/index.html';
};

find(
    sub {
        return if !-f;
        return if $File::Find::name !~ /\.pm$/;
        require $File::Find::name;
    },
    abs_path("$FindBin::Bin/../lib") . '/TMS/Transport/Dancer/Routes'
);

true;
