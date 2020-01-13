package TMS::Test::Core::CmmPackageTier;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::CmmPackage;

my $attr = {
    'package'    => {},
    'Percentage' => ' ',
    'Threshold'  => ' ',
    'Name'       => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CmmPackageTier';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
