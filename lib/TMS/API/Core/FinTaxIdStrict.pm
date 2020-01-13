package TMS::API::Core::FinTaxIdStrict;
use Moose::Role;

has 'ID_Type'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '1');
has 'Tax_ID'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Need1099' => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '0');

1;
