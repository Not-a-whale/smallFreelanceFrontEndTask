package TMS::API::Core::InvEquipmentTypeStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '1');

1;
