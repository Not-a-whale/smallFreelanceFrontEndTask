package TMS::Test::Core::FinAccountTypesTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccountType;

my $attr = {
    'ancestor' => {
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
    },
    'descendant' => {
        'UserDefined'  => ' ',
        'DisplayOrder' => ' ',
        'Credit'       => ' ',
        'IncomeSheet'  => ' ',
        'BalanceSheet' => ' ',
        'Temp'         => ' ',
        'Debit'        => ' ',
        'Valid'        => ' ',
        'Editable'     => ' ',
        'Name'         => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountTypesTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
