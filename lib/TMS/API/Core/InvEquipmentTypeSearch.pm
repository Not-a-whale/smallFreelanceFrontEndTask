package TMS::API::Core::InvEquipmentTypeSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '0');

1;
