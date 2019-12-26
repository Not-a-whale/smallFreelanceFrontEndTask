package TMS::API::Core::HrResidenceSearch;
use Moose::Role;

has 'AstId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'DateMovedIn' => ('is' => 'rw', 'isa' => 'DATETIME',    'coerce' => '1', 'required' => '0');
has 'ResAddress'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'ResPhone'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
