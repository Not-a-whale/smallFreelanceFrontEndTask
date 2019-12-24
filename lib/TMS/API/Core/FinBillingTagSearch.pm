package TMS::API::Core::FinBillingTagSearch;
use Moose::Role;

has 'BillingTag' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
