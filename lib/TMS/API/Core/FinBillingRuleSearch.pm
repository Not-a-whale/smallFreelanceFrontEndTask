package TMS::API::Core::FinBillingRuleSearch;
use Moose::Role;

has 'Amount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'Rule'   => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');

1;
