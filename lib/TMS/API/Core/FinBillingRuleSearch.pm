package TMS::API::Core::FinBillingRuleSearch;
use Moose::Role;

has 'BankAccount' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
