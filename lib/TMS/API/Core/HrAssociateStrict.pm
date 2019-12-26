package TMS::API::Core::HrAssociateStrict;
use Moose::Role;

has 'AstId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');

1;
