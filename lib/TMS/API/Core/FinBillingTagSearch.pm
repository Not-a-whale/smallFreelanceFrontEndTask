package TMS::API::Core::FinBillingTagSearch;
use Moose::Role;

has 'BillingTag' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
