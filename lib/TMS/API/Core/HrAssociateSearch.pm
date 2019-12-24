package TMS::API::Core::HrAssociateSearch;
use Moose::Role;

has 'AstId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
