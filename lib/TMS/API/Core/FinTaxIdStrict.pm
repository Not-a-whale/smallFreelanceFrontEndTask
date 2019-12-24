package TMS::API::Core::FinTaxIdStrict;
use Moose::Role;

has 'EntityId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '1');
has 'ID_Type'  => ('is' => 'rw', 'isa' => 'Any',              'required' => '1');
has 'Tax_ID'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
