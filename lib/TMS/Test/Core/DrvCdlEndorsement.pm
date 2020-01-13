package TMS::Test::Core::DrvCdlEndorsement;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Endorsement'   => ' ',
    'ValidFromDate' => ' ',
    'ExpiredDate'   => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::DrvCdlEndorsement';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
