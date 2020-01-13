package TMS::API::Core::FinBillingInfoSearch;
use Moose::Role;

has 'PayToTheOrderOf' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
