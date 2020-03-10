package TMS::API::Core::FinTaxIdStrict;
use Moose::Role;

has 'ID_Type'  => ('is' => 'rw', 'isa' => 'enum_ID_Type', 'coerce' => '1', 'required' => '1');
has 'Tax_ID'   => ('is' => 'rw', 'isa' => 'VarChar16',    'coerce' => '1', 'required' => '1');
has 'Need1099' => ('is' => 'rw', 'isa' => 'BoolInt',      'coerce' => '1', 'required' => '1', 'default' => '0');

1;
