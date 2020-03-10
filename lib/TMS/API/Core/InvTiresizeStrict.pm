package TMS::API::Core::InvTiresizeStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar16', 'coerce' => '1', 'required' => '1');
has 'Type' => ('is' => 'rw', 'isa' => 'set_Type',  'coerce' => '1', 'required' => '1', 'default' => 'Truck');

1;
