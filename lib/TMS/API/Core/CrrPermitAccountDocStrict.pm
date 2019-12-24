package TMS::API::Core::CrrPermitAccountDocStrict;
use Moose::Role;

has 'CrrPrmtAccDoc' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'CrrPrmtAccId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
