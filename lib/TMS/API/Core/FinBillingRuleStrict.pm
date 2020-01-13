package TMS::API::Core::FinBillingRuleStrict;
use Moose::Role;

has 'Amount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1', 'default' => '100.00');
has 'Rule'   => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '1', 'default' => 'percentage');

1;
