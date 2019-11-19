package TMS::API::Feature::Addresses::Interface;

use TMS::API::Feature::Addresses::CntAddress;

sub default {shift}

sub create {
    my $post = shift;
    my $args = $$post{POST};

    my $obj = TMS::API::Feature::Addresses::CntAddress->new(%$args);
    $obj->FindOrCreate();
    return $obj->DataHash;
}

sub search {
    my $post = shift;
    my $args = TMS::API::Feature::Addresses::CntAddress::Sifter($$post{POST});
    my $srch = {map { $_ => {rlike => $$args{$_}} } keys %$args};
    my $obj  = TMS::API::Feature::Addresses::CntAddress->new(%$args);
    $$post{"DATA"} = $obj->Show($srch);
    return $post;
}

sub meta {
    my $post = shift;
    my $args = $$post{POST};
    my $meta = {
        headers => [
            {name => 'Street1', size => 'c2'},
            {name => 'Street2', size => 'c2'},
            {name => 'Street3', size => 'c2'},
            {name => 'City',    size => 'c2'},
            {name => 'Zip',     size => 'c2'},
            {name => 'State',   size => 'c2'},
        ],
        searchurl => '/api/addresses/search',
    };

    return {
        ERROR => "",
        POST  => $args,
        META  => $meta,
    };
}

1;
