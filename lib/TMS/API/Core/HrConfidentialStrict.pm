package TMS::API::Core::HrConfidentialStrict;
use Moose::Role;

has 'AstId'         => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');
has 'Birthday'      => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '1');
has 'Gender'        => ('is' => 'rw', 'isa' => 'Any',           'required' => '1');
has 'MaritalStatus' => ('is' => 'rw', 'isa' => 'Any',           'required' => '1');
has 'PersonalPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');

1;
