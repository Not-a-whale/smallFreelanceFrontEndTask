package TMS::API::Core::HrConfidentialSearch;
use Moose::Role;

has 'AstId'         => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'Birthday'      => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'Gender'        => ('is' => 'rw', 'isa' => 'Any',           'required' => '0');
has 'MaritalStatus' => ('is' => 'rw', 'isa' => 'Any',           'required' => '0');
has 'PersonalPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');

1;
