package TMS::API::Core::InvEquipmentStrict;
use Moose::Role;

has 'GeneralName' => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '1');

1;
