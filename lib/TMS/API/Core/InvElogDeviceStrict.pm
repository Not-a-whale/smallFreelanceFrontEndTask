package TMS::API::Core::InvElogDeviceStrict;
use Moose::Role;

has 'ElogDeviceId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');

1;
