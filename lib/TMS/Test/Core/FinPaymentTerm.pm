package TMS::Test::Core::FinPaymentTerm;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'DueNext'         => ' ',
    'DueInDays'       => ' ',
    'DiscountAmount'  => ' ',
    'DiscountPercent' => ' ',
    'DiscountInDays'  => ' ',
    'Name'            => ' ',
    'Type'            => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinPaymentTerm';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
