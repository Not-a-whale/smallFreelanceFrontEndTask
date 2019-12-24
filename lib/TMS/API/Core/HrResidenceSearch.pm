package TMS::API::Core::HrResidenceSearch;
use Moose::Role;

has 'AstId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'DateMovedIn' => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '0');
has 'ResAddress'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'ResPhone'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
