package TMS::Test::Core::EntBusiness;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'BizName' => ' ',
    'BizURL'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntBusiness';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
