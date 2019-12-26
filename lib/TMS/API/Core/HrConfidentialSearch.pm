package TMS::API::Core::HrConfidentialSearch;
use Moose::Role;

has 'AstId'         => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'Birthday'      => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'Gender'        => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');
has 'MaritalStatus' => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');
has 'PersonalPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

1;
