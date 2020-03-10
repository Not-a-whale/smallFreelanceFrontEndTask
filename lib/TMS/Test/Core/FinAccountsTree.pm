package TMS::Test::Core::FinAccountsTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccount;
use TMS::API::Core::FinAccountType;

my $attr = {
    'ancestor' => {
        'account_type' => {
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
        'ExternalName' => ' ',
        'UserDefined'  => ' ',
        'Description'  => ' ',
        'Balance'      => ' ',
        'DateCreated'  => ' ',
        'Valid'        => ' ',
        'Code'         => ' ',
        'Name'         => ' ',
        'Active'       => ' '
    },
    'descendant' => {
        'account_type' => {
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
        'ExternalName' => ' ',
        'UserDefined'  => ' ',
        'Description'  => ' ',
        'Balance'      => ' ',
        'DateCreated'  => ' ',
        'Valid'        => ' ',
        'Code'         => ' ',
        'Name'         => ' ',
        'Active'       => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountsTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
