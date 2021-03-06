package TMS::Test::Core::EntShipper;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;

my $attr = {
    'shipper' => {
        'BizName' => ' ',
        'BizURL'  => ' '
    },
    'Notes' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntShipper';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
