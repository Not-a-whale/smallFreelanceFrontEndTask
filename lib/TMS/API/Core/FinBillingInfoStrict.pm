package TMS::API::Core::FinBillingInfoStrict;
use Moose::Role;

has 'Address'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'BillingTagId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'EntityId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'PayToTheOrderOf' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Phone'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
