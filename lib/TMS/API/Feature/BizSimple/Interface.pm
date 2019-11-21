package TMS::API::Feature::BizSimple::Interface;

use strict;
use warnings FATAL => 'all';

use TMS::API::Feature::BizSimple::EntBusiness;

sub default {shift}

sub create {
    my $post = shift;

    my $args = TMS::API::Feature::BizSimple::EntBusiness::Sifter($$post{POST});
    my $obj  = TMS::API::Feature::BizSimple::EntBusiness->new(%$args);
    $obj->FindOrCreate();
    $$post{"DATA"} = $obj->Show;
    return $post;
}

sub search {
    my $post = shift;

    my $args = TMS::API::Feature::BizSimple::EntBusiness::Sifter($$post{POST});
    my $obj  = TMS::API::Feature::BizSimple::EntBusiness->new(%$args);
    my $attr = $obj->DataHash;

    my $srch = {map { $_ => {rlike => $$attr{$_}} } keys %$args};
    $$post{"DATA"} = $obj->Show($srch);
    return $post;
}

sub meta {
    my $post = shift;
    my $args = $$post{POST};
    my $meta = {
        headers => [
            {name => 'BizId',    size => 'c3'},
            {name => 'BizName',  size => 'c3'},
            {name => 'BizURL',   size => 'c3'},
            {name => 'RootNode', size => 'c3'},
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
