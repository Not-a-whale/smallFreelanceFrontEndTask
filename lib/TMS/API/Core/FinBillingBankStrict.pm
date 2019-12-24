package TMS::API::Core::FinBillingBankStrict;
use Moose::Role;

has 'AccountNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'BillingId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Institution'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'RoutingNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
