package TMS::API::Core::FinBillingInfoStrict;
use Moose::Role;

has 'PayToTheOrderOf' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
