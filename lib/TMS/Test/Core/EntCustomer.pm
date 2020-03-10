package TMS::Test::Core::EntCustomer;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;

my $attr = {
    'cstmr' => {
        'BizName' => ' ',
        'BizURL'  => ' '
    },
    'DOT'              => ' ',
    'DontUse'          => ' ',
    'MC'               => ' ',
    'Factoring'        => ' ',
    'Terms'            => ' ',
    'Bond'             => ' ',
    'SCAC'             => ' ',
    'WhyDontUse'       => ' ',
    'DUNS'             => ' ',
    'CreditLimit'      => ' ',
    'RequireOriginals' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntCustomer';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
