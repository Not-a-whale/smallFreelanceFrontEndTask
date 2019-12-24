package TMS::API::Core::InvElogDeviceStrict;
use Moose::Role;

has 'ElogDeviceId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
