package TMS::Test::Core::FinAccountType;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'BalanceSheet' => ' ',
    'IncomeSheet'  => ' ',
    'Credit'       => ' ',
    'Name'         => ' ',
    'Debit'        => ' ',
    'DisplayOrder' => ' ',
    'Temp'         => ' ',
    'UserDefined'  => ' ',
    'Valid'        => ' ',
    'Editable'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountType';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
