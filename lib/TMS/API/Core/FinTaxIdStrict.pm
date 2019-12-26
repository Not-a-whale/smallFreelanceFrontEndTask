package TMS::API::Core::FinTaxIdStrict;
use Moose::Role;

has 'EntityId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '1');
has 'ID_Type'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '1');
has 'Tax_ID'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
