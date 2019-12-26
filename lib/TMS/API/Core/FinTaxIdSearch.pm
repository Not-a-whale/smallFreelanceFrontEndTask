package TMS::API::Core::FinTaxIdSearch;
use Moose::Role;

has 'EntityId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'ID_Type'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'Tax_ID'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Need1099' => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');

1;
