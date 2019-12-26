package TMS::API::Core::HrAssociateStrict;
use Moose::Role;

has 'AstId'          => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');
has 'AuthorityLevel' => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '1', 'default' => 'member');
has 'PrimaryContact' => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '0');

1;
