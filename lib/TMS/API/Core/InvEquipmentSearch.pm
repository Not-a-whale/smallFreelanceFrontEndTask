package TMS::API::Core::InvEquipmentSearch;
use Moose::Role;

has 'GeneralName' => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '0');

1;
