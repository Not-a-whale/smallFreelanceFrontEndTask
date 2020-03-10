package TMS::API::Core::HrConfidentialSearch;
use Moose::Role;

has 'Birthday'      => ('is' => 'rw', 'isa' => 'DATETIME',           'coerce' => '1', 'required' => '0');
has 'Gender'        => ('is' => 'rw', 'isa' => 'enum_Gender',        'coerce' => '1', 'required' => '0');
has 'MaritalStatus' => ('is' => 'rw', 'isa' => 'enum_MaritalStatus', 'coerce' => '1', 'required' => '0');

1;
