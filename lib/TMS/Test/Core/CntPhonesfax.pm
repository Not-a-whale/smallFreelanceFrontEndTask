package TMS::Test::Core::CntPhonesfax;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Extension' => ' ',
    'Mobility'  => ' ',
    'Features'  => ' ',
    'Number'    => ' ',
    'Notes'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CntPhonesfax';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
