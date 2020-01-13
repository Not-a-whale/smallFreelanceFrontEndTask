package TMS::Test::Core::EntCustomer;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;

my $attr = {
    'cstmr' => {
        'BizURL'  => ' ',
        'BizName' => ' '
    },
    'SCAC'             => ' ',
    'RequireOriginals' => ' ',
    'Bond'             => ' ',
    'Terms'            => ' ',
    'CreditLimit'      => ' ',
    'WhyDontUse'       => ' ',
    'DOT'              => ' ',
    'DUNS'             => ' ',
    'MC'               => ' ',
    'DontUse'          => ' ',
    'Factoring'        => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntCustomer';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
