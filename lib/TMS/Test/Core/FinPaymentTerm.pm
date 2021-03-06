package TMS::Test::Core::FinPaymentTerm;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'DiscountAmount'  => ' ',
    'DueNext'         => ' ',
    'DueInDays'       => ' ',
    'Type'            => ' ',
    'DiscountPercent' => ' ',
    'Name'            => ' ',
    'DiscountInDays'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinPaymentTerm';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
