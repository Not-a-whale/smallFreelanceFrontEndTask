package TMS::Transport::Dancer::TMS;
use Dancer2;
use Dancer2::Logger::File;
use strict;
use warnings;
use Data::Dumper;
use Try::Tiny;

use TMS::Transport::Dancer::Navigation;
use TMS::Transport::Dancer::TransactionTemplate;
use TMS::Transport::Dancer::FileUpload;

set session => 'Simple';
set engines => {
    serializer => {
        JSON => {
            allow_nonref => 1
        }
    }
};

set serializer => 'JSON';
set content_type => 'application/json';

our $VERSION = '3.1';

get '/' => sub {
    send_as 'html' => send_file '/index.html';
};

true;
