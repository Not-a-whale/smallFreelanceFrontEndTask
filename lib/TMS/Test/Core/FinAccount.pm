package TMS::Test::Core::FinAccount;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccountType;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccount';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
