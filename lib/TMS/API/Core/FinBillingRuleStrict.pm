package TMS::API::Core::FinBillingRuleStrict;
use Moose::Role;

has 'BankAccount' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
