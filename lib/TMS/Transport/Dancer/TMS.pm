package TMS::Transport::Dancer::TMS;

use strict;
use warnings FATAL => 'all';
use feature 'current_sub';

use JSON;
use Dancer2;
use Dancer2::Logger::File;
use Dancer2::Plugin::Auth::HTTP::Basic::DWIW;
use File::Find;
use FindBin;
use Cwd 'abs_path';
use TMS::Schema;

our $VERSION = '3.1';

get '/' => sub { send_as 'html' => send_file '/index.html' };

find(
    sub {
        return if !-f;
        return if $File::Find::name !~ /\.pm$/;
        require $File::Find::name;
    },
    abs_path("$FindBin::Bin/../lib") . '/TMS/Transport/Dancer/Tools',    # tooling - login, prefetch, route list etc.
    abs_path("$FindBin::Bin/../lib") . '/TMS/Transport/Dancer/Routes'    # auto-generated by prefetch (mostly)
);

sub BuildRoutes {
    my ($class, $prefix) = @_;
    #have to clear the prefix
    prefix($prefix);

    get ''         => http_basic_auth required => sub { $class->new()->Search(body_parameters->mixed) };
    post ''        => http_basic_auth required => sub { $class->new()->Search(body_parameters->mixed) };
    get '/search'  => http_basic_auth required => sub { $class->new()->Search(body_parameters->mixed) };
    post '/search' => http_basic_auth required => sub { $class->new()->Search(body_parameters->mixed) };
    post '/fetch'  => http_basic_auth required => sub { $class->new()->Fetch(body_parameters->mixed) };
    post '/create' => http_basic_auth required => sub { $class->new()->Create(body_parameters->mixed) };
    post '/update' => http_basic_auth required => sub { $class->new()->Update(body_parameters->mixed) };
    post '/delete' => http_basic_auth required => sub { $class->new()->Delete(body_parameters->mixed) };
    prefix(undef);
    return 1;
}

1;
