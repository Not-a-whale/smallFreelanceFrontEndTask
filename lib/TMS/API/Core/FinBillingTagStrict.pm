package TMS::API::Core::FinBillingTagStrict;
use Moose::Role;

has 'BillingTag' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
