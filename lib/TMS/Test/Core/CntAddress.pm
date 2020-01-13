package TMS::Test::Core::CntAddress;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'State'   => ' ',
    'Street2' => ' ',
    'Notes'   => ' ',
    'Zip'     => ' ',
    'Street3' => ' ',
    'Street1' => ' ',
    'GpsLng'  => ' ',
    'Country' => ' ',
    'GpsLat'  => ' ',
    'City'    => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CntAddress';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
