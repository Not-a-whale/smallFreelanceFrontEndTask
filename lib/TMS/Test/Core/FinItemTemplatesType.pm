package TMS::Test::Core::FinItemTemplatesType;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Description'   => ' ',
    'DisplayToUser' => ' ',
    'UserDefined'   => ' ',
    'Name'          => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinItemTemplatesType';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
