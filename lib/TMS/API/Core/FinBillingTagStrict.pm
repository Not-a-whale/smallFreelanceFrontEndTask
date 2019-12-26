package TMS::API::Core::FinBillingTagStrict;
use Moose::Role;

has 'BillingTag' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
