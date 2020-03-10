package TMS::API::Core::FinBillingBankSearch;
use Moose::Role;

has 'AccountNumber' => ('is' => 'rw', 'isa' => 'VarChar255',       'coerce' => '1', 'required' => '0');
has 'RoutingNumber' => ('is' => 'rw', 'isa' => 'VarChar255',       'coerce' => '1', 'required' => '0');
has 'AccountType'   => ('is' => 'rw', 'isa' => 'enum_AccountType', 'coerce' => '1', 'required' => '0');
has 'Active'        => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');
has 'Purpose'       => ('is' => 'rw', 'isa' => 'enum_Purpose',     'coerce' => '1', 'required' => '0');

1;
