package TMS::Test::Core::AppPermission;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::AppFeature;

my $attr = {
    'feature' => {
        'Notes' => ' ',
        'Name'  => ' '
    },
    'AccessName' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppPermission';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
