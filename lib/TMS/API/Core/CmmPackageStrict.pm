package TMS::API::Core::CmmPackageStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
