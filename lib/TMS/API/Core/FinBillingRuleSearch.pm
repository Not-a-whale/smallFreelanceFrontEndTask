package TMS::API::Core::FinBillingRuleSearch;
use Moose::Role;

has 'Amount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'Rule'   => ('is' => 'rw', 'isa' => 'enum_Rule',     'coerce' => '1', 'required' => '0');

1;
