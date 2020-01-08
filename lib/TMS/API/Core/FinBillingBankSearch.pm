package TMS::API::Core::FinBillingBankSearch;
use Moose::Role;

has 'AccountNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'RoutingNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'AccountType'   => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'Active'        => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');
has 'Purpose'       => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');

1;
