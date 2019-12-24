package TMS::API::Core::FinBillingRuleSearch;
use Moose::Role;

has 'BankAccount' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
