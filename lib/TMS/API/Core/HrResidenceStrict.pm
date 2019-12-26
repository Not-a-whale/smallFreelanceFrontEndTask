package TMS::API::Core::HrResidenceStrict;
use Moose::Role;

has 'AstId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'DateMovedIn' => ('is' => 'rw', 'isa' => 'DATETIME',    'coerce' => '1', 'required' => '1');
has 'ResAddress'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'ResPhone'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
