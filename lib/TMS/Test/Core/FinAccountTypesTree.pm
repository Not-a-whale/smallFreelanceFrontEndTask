package TMS::Test::Core::FinAccountTypesTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccountType;

my $attr = {
    'ancestor' => {
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
    },
    'descendant' => {
        'IncomeSheet'  => ' ',
        'Temp'         => ' ',
        'Valid'        => ' ',
        'Credit'       => ' ',
        'UserDefined'  => ' ',
        'Name'         => ' ',
        'Editable'     => ' ',
        'BalanceSheet' => ' ',
        'DisplayOrder' => ' ',
        'Debit'        => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountTypesTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
