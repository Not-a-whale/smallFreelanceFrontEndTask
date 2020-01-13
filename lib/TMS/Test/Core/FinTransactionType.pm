package TMS::Test::Core::FinTransactionType;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {'TransTypeName' => ' '};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinTransactionType';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
