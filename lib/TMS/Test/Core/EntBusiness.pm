package TMS::Test::Core::EntBusiness;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'BizURL'  => ' ',
    'BizName' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntBusiness';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
