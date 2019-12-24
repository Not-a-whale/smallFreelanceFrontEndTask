package TMS::API::Core::InvElogDeviceSearch;
use Moose::Role;

has 'ElogDeviceId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
