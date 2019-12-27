package TMS::Transport::Dancer::TMS;

use strict;
use warnings;

use Dancer2;
use Dancer2::Logger::File;
use Dancer2::Plugin::Auth::HTTP::Basic::DWIW;
use Data::Dumper;
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

http_basic_auth_handler check_login => sub {
    my ($user, $pass) = @_;
    my $route  = request->route->spec_route;
    my $method = request->route->method;
    return $user eq 'test' && $pass eq 'test';
};

http_basic_auth_handler no_auth => sub {
    send_as 'html' => send_file '/unauthorized.html';
};

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

sub BuildRoutes {
    my ($class, $prefix) = @_;
    prefix($prefix);

    get '/search'  => http_basic_auth required => sub { $class->new()->Search(http_basic_auth_login(), body_parameters->mixed) };
    post '/search' => http_basic_auth required => sub { $class->new()->Search(http_basic_auth_login(), body_parameters->mixed) };
    post '/create' => http_basic_auth required => sub { $class->new()->Create(http_basic_auth_login(), body_parameters->mixed) };
    post '/update' => http_basic_auth required => sub { $class->new()->Update(http_basic_auth_login(), body_parameters->mixed) };
    post '/delete' => http_basic_auth required => sub { $class->new()->Delete(http_basic_auth_login(), body_parameters->mixed) };
} ## end sub BuildRoutes

1;
