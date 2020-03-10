package TMS::API::Core::FinBillingInfoSearch;
use Moose::Role;

has 'PayToTheOrderOf' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
