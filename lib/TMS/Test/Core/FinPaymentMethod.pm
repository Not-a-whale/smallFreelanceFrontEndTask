package TMS::Test::Core::FinPaymentMethod;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinPaymentMethod';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
