package TMS::API::Core::FinBillingBankStrict;
use Moose::Role;

has 'AccountNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'BillingId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'Institution'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'RoutingNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'AccountType'   => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '1', 'default' => 'checking');
has 'Active'        => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');
has 'Purpose' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'billing and payment');

1;
