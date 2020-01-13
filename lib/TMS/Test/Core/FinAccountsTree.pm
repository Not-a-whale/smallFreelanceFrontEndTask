package TMS::Test::Core::FinAccountsTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccountType;
use TMS::API::Core::FinAccount;

my $attr = {
    'ancestor' => {
        'account_type' => {
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
        'Active'       => ' ',
        'UserDefined'  => ' ',
        'Code'         => ' ',
        'Balance'      => ' ',
        'ExternalName' => ' ',
        'Description'  => ' ',
        'Valid'        => ' ',
        'DateCreated'  => ' ',
        'Name'         => ' '
    },
    'descendant' => {
        'account_type' => {
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
        'Active'       => ' ',
        'UserDefined'  => ' ',
        'Code'         => ' ',
        'Balance'      => ' ',
        'ExternalName' => ' ',
        'Description'  => ' ',
        'Valid'        => ' ',
        'DateCreated'  => ' ',
        'Name'         => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountsTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
