package TMS::API::Core::FinTaxIdSearch;
use Moose::Role;

has 'ID_Type'  => ('is' => 'rw', 'isa' => 'enum_ID_Type', 'coerce' => '1', 'required' => '0');
has 'Tax_ID'   => ('is' => 'rw', 'isa' => 'VarChar16',    'coerce' => '1', 'required' => '0');
has 'Need1099' => ('is' => 'rw', 'isa' => 'BoolInt',      'coerce' => '1', 'required' => '0');

1;
