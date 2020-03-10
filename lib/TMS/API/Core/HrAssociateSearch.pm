package TMS::API::Core::HrAssociateSearch;
use Moose::Role;

has 'AuthorityLevel' => ('is' => 'rw', 'isa' => 'enum_AuthorityLevel', 'coerce' => '1', 'required' => '0');
has 'PrimaryContact' => ('is' => 'rw', 'isa' => 'BoolInt',             'coerce' => '1', 'required' => '0');

1;
