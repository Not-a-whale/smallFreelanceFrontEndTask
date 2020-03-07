package TMS::Transport::Dancer::TMS;

use strict;
use warnings;

use Dancer2;
use Dancer2::Logger::File;
use Dancer2::Plugin::Auth::HTTP::Basic::DWIW;
use File::Find;
use FindBin;
use Cwd 'abs_path';
use TMS::Schema;

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

my $prefetchLib = abs_path("$FindBin::Bin/../lib") . '/TMS/Transport/Dancer/Tools/Prefetch.pm';
require $prefetchLib;

get '/api/routes' => sub {
    my $app = app();

    my %get  = map { $_, 1 } CleanRgxRoutes($app->routes_regexps_for('get'));
    my %post = map { $_, 1 } CleanRgxRoutes($app->routes_regexps_for('post'));
    my %all  = map { $_, 1 } keys %get, keys %post;
    my $count = 0;
    my $out   = <<~EOH;
    <style type="text/css">
    table,td {
            border-collapse: collapse;
            border: 1px solid #000000;
    }
    td { padding: 5px;
    </style>
    EOH

    foreach (sort keys %all) {
        $out .= '<tr>';

        $out .= sprintf '<td>%d</td>', ++$count;
        $out .= sprintf '<td>%s</td>', exists $get{$_} ? 'GET' : '';
        $out .= sprintf '<td>%s</td>', exists $post{$_} ? 'POST' : '';
        $out .= sprintf '<td>%s</td>', exists $get{$_} ? "<a href='$_' target='_blank'>$_</a>" : $_;

        $out .= '</tr>';
    }
    send_as 'html' => "<table>$out</table>";
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

    get ''         => http_basic_auth required => sub { $class->new()->Search(http_basic_auth_login(), body_parameters->mixed) };
    post ''        => http_basic_auth required => sub { $class->new()->Search(http_basic_auth_login(), body_parameters->mixed) };
    get '/search'  => http_basic_auth required => sub { $class->new()->Search(http_basic_auth_login(), body_parameters->mixed) };
    post '/search' => http_basic_auth required => sub { $class->new()->Search(http_basic_auth_login(), body_parameters->mixed) };
    post '/create' => http_basic_auth required => sub { $class->new()->Create(http_basic_auth_login(), body_parameters->mixed) };
    post '/update' => http_basic_auth required => sub { $class->new()->Update(http_basic_auth_login(), body_parameters->mixed) };
    post '/delete' => http_basic_auth required => sub { $class->new()->Delete(http_basic_auth_login(), body_parameters->mixed) };
}

sub CleanRgxRoutes {
    my $ref = shift;
    my @lst = ();
    foreach (sort @$ref) {
        s/\^//g;
        s/\\//g;
        s/\$//g;
        push @lst, $_;
    }
    return @lst;
}

1;
