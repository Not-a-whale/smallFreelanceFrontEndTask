post '/api/addresses'        => \&default;
post '/api/addresses/create' => \&create;
get '/api/addresses/meta'    => \&meta;
post '/api/addresses/meta'   => \&meta;
post '/api/addresses/search' => \&search;

sub default {
    return body_parameters->mixed;
}

sub create {
    my $post = body_parameters->mixed;
    my $args = $$post{POST};

    my $obj = TMS::API::Feature::CntAddress->new(%$args);
    $obj->FindOrCreate();
    return $obj->DataHash;
}

sub search {
    my $post = body_parameters->mixed;
    my $args = TMS::API::Feature::CntAddress::Sifter($$post{POST});
    my $srch = {map { $_ => {rlike => $$args{$_}} } keys %$args};
    my $obj  = TMS::API::Feature::CntAddress->new(%$args);
    $$post{"DATA"} = $obj->Show($srch);
    return $post;
}

sub meta {
    my $post = body_parameters->mixed;
    my $args = $$post{POST};
    my $meta = {
        headers   => [{Street1 => '2c'}, {Street2 => '2c'}, {Street3 => '2c'}, {City => '2c'}, {Zip => '2c'}, {State => '2c'},],
        searchurl => '/api/addresses/search',
    };

    return {
        ERROR => "",
        POST  => $args,
        META  => $meta,
    };
}
