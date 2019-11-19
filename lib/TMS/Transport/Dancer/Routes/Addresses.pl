#!/usr/bin/perl
END {<STDIN>}

BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    unshift @INC, abs_path(dirname(abs_path($0)) . '/../../../../../lib');
}

use Moose;
use TMS::API::Feature::Addresses::Interface;
use Data::Dumper;

my $post = {
    "POST"   => {"City" => "San fran"},
    "DATA"   => "",
    "sifted" => {},
    "ERROR"  => ""
};

my $args = TMS::API::Feature::Addresses::CntAddress::Sifter($$post{POST});
my $srch = {map { $_ => {rlike =>  $$args{$_}} } keys %$args};
my $obj  = TMS::API::Feature::Addresses::CntAddress->new(%$args);
$$post{"DATA"} = $obj->Show($srch);

print Dumper($post);
