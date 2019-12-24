package TMS::API::Core::InvEquipmentToSupportSearch;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'SupportId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
