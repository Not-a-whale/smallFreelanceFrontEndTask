package TMS::API::Core::FinBillingBankStrict;
use Moose::Role;

has 'AccountNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'BillingId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'Institution'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'RoutingNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
