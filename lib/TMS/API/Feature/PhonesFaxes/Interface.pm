package TMS::API::Feature::PhonesFaxes::Interface;

use TMS::API::Feature::PhonesFaxes::CntPhonesfax;

sub default {shift}

sub create {
    my $post = shift;
    my $args = $$post{POST};

    my $obj = TMS::API::Feature::PhonesFaxes::CntPhonesfax->new(%$args);
    $obj->FindOrCreate();
    return $obj->DataHash;
}

sub search {
    my $post = shift;
    my $args = TMS::API::Feature::PhonesFaxes::CntPhonesfax::Sifter($$post{POST});
    my $srch = {map { $_ => {rlike => $$args{$_}} } keys %$args};
    my $obj  = TMS::API::Feature::PhonesFaxes::CntPhonesfax->new(%$args);
    $$post{"DATA"} = $obj->Show($srch);
    return $post;
}

sub meta {
    my $post = shift;
    my $args = $$post{POST};
    my $meta = {
        headers => [
            {name => 'PhnFaxId',  size => 'c2'},
            {name => 'Number',    size => 'c2'},
            {name => 'Extension', size => 'c2'},
            {name => 'Features',  size => 'c2'},
            {name => 'Mobility',  size => 'c2'},
            {name => 'Notes',     size => 'c2'},
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
