package TMS::Test::Core::FinAccountType;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'IncomeSheet'  => ' ',
    'Temp'         => ' ',
    'Valid'        => ' ',
    'Credit'       => ' ',
    'UserDefined'  => ' ',
    'Name'         => ' ',
    'BalanceSheet' => ' ',
    'Editable'     => ' ',
    'DisplayOrder' => ' ',
    'Debit'        => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountType';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
