package TMS::API::Core::HrAssociateSearch;
use Moose::Role;

has 'AstId'          => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'AuthorityLevel' => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');
has 'PrimaryContact' => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0');

1;
