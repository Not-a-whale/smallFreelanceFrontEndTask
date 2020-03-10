package TMS::API::Core::FinPaymentTermStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '1');
has 'Type' => ('is' => 'rw', 'isa' => 'enum_Type',   'coerce' => '1', 'required' => '1');

1;
