package TMS::API::Core::HrAssociateStrict;
use Moose::Role;

has 'AstId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
