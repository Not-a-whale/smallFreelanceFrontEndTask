package TMS::Test::Core::FinAccountTypesTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccountType;

my $attr = {
    'ancestor' => {
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
    },
    'descendant' => {
        'BalanceSheet' => ' ',
        'IncomeSheet'  => ' ',
        'Name'         => ' ',
        'Credit'       => ' ',
        'Debit'        => ' ',
        'UserDefined'  => ' ',
        'Temp'         => ' ',
        'DisplayOrder' => ' ',
        'Valid'        => ' ',
        'Editable'     => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountTypesTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
