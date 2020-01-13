package TMS::Test::Core::CntAddress;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Street3' => ' ',
    'State'   => ' ',
    'Street2' => ' ',
    'Notes'   => ' ',
    'GpsLng'  => ' ',
    'City'    => ' ',
    'GpsLat'  => ' ',
    'Street1' => ' ',
    'Country' => ' ',
    'Zip'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CntAddress';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
