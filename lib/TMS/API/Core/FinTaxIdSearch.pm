package TMS::API::Core::FinTaxIdSearch;
use Moose::Role;

has 'EntityId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'ID_Type'  => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');
has 'Tax_ID'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
