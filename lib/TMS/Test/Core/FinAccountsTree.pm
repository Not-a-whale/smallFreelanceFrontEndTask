package TMS::Test::Core::FinAccountsTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccount;
use TMS::API::Core::FinAccountType;

my $attr = {
    'ancestor' => {
        'account_type' => {
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
        'Balance'      => ' ',
        'Valid'        => ' ',
        'Code'         => ' ',
        'UserDefined'  => ' ',
        'Name'         => ' ',
        'ExternalName' => ' ',
        'Description'  => ' ',
        'Active'       => ' ',
        'DateCreated'  => ' '
    },
    'descendant' => {
        'account_type' => {
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
        'Balance'      => ' ',
        'Valid'        => ' ',
        'Code'         => ' ',
        'UserDefined'  => ' ',
        'Name'         => ' ',
        'ExternalName' => ' ',
        'Description'  => ' ',
        'Active'       => ' ',
        'DateCreated'  => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountsTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
