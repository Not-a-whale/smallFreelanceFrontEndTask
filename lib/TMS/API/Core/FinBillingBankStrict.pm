package TMS::API::Core::FinBillingBankStrict;
use Moose::Role;

has 'AccountNumber' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');
has 'RoutingNumber' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');
has 'AccountType' =>
    ('is' => 'rw', 'isa' => 'enum_AccountType', 'coerce' => '1', 'required' => '1', 'default' => 'checking');
has 'Active' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '1');
has 'Purpose' =>
    ('is' => 'rw', 'isa' => 'enum_Purpose', 'coerce' => '1', 'required' => '1', 'default' => 'billing and payment');

1;
