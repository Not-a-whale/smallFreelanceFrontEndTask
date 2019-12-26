package TMS::API::Core::HrAssociateSearch;
use Moose::Role;

has 'AstId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
