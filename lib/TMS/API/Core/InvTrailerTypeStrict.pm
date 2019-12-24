package TMS::API::Core::InvTrailerTypeStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
