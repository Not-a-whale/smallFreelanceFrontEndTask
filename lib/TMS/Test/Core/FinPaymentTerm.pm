package TMS::Test::Core::FinPaymentTerm;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Type'            => ' ',
    'DiscountPercent' => ' ',
    'DiscountInDays'  => ' ',
    'DueInDays'       => ' ',
    'Name'            => ' ',
    'DiscountAmount'  => ' ',
    'DueNext'         => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinPaymentTerm';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
