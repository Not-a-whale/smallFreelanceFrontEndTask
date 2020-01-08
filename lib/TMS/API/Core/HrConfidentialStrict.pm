package TMS::API::Core::HrConfidentialStrict;
use Moose::Role;

has 'Birthday'      => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '1');
has 'Gender'        => ('is' => 'rw', 'isa' => 'Any',      'coerce' => '0', 'required' => '1');
has 'MaritalStatus' => ('is' => 'rw', 'isa' => 'Any',      'coerce' => '0', 'required' => '1');

1;
