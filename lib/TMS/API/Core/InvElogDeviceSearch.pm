package TMS::API::Core::InvElogDeviceSearch;
use Moose::Role;

has 'ElogDeviceId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
