package TMS::API::Core::FinBillingInfoStrict;
use Moose::Role;

has 'PayToTheOrderOf' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
