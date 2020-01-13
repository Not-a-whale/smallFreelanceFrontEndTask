package TMS::Test::Core::FinAccount;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccountType;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccount';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
