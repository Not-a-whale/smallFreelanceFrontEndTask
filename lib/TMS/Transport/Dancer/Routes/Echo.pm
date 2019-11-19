post '/echo' => sub {
    return body_parameters->mixed;
};

post '/echo:*' => sub {
    my $post = {
        body  => body_parameters->mixed,
        route => route_parameters->mixed,
    };
    return $post;
};
