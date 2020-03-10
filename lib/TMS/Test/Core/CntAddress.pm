package TMS::Test::Core::CntAddress;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'GpsLat'  => ' ',
    'Notes'   => ' ',
    'Street2' => ' ',
    'GpsLng'  => ' ',
    'City'    => ' ',
    'Street1' => ' ',
    'State'   => ' ',
    'Country' => ' ',
    'Street3' => ' ',
    'Zip'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CntAddress';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
