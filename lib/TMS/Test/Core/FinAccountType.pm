package TMS::Test::Core::FinAccountType;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'UserDefined'  => ' ',
    'DisplayOrder' => ' ',
    'Credit'       => ' ',
    'BalanceSheet' => ' ',
    'IncomeSheet'  => ' ',
    'Temp'         => ' ',
    'Debit'        => ' ',
    'Valid'        => ' ',
    'Editable'     => ' ',
    'Name'         => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountType';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
