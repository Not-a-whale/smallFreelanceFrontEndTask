package TMS::API::Core::HrAssociateStrict;
use Moose::Role;

has 'AuthorityLevel' =>
    ('is' => 'rw', 'isa' => 'enum_AuthorityLevel', 'coerce' => '1', 'required' => '1', 'default' => 'member');
has 'PrimaryContact' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');

1;
