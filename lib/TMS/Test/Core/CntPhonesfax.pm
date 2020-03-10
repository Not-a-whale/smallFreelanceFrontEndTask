package TMS::Test::Core::CntPhonesfax;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Number'    => ' ',
    'Notes'     => ' ',
    'Features'  => ' ',
    'Extension' => ' ',
    'Mobility'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CntPhonesfax';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
