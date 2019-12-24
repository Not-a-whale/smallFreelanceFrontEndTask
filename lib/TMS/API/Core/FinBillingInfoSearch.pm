package TMS::API::Core::FinBillingInfoSearch;
use Moose::Role;

has 'Address'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'BillingTagId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'EntityId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'PayToTheOrderOf' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Phone'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
