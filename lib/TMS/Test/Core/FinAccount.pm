package TMS::Test::Core::FinAccount;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccountType;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccount';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
