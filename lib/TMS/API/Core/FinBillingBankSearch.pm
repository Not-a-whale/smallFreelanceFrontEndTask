package TMS::API::Core::FinBillingBankSearch;
use Moose::Role;

has 'AccountNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'BillingId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Institution'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'RoutingNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
