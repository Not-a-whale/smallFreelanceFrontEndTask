package TMS::API::Core::FinBillingRuleStrict;
use Moose::Role;

has 'BankAccount' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
