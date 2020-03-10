package TMS::API::Core::FinPaymentTermSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '0');
has 'Type' => ('is' => 'rw', 'isa' => 'enum_Type',   'coerce' => '1', 'required' => '0');

1;
