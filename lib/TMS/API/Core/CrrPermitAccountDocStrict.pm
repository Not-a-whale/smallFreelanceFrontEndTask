package TMS::API::Core::CrrPermitAccountDocStrict;
use Moose::Role;

has 'CrrPrmtAccDoc' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'CrrPrmtAccId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
