
http_basic_auth_handler check_login => sub {
    my ($user, $pass) = @_;
    my $route  = request->route->spec_route;
    my $method = request->route->method;
    return $user eq 'test' && $pass eq 'test';
};

http_basic_auth_handler no_auth => sub {
    send_as 'html' => send_file '/unauthorized.html';
};

get '/api/login' => http_basic_auth required => sub {
    my ($user,$pass) = http_basic_auth_login();
    my $url = query_parameters->get('requested_path');
    session userid => $user;
    redirect query_parameters->get('requested_path');
};

hook before => sub {
    if (!session('userid') && request->path !~ m{^/api\/login}) {
        forward '/api/login', { requested_path => request->path };
    }
};
