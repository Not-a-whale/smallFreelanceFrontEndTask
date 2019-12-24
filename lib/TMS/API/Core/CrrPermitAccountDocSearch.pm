package TMS::API::Core::CrrPermitAccountDocSearch;
use Moose::Role;

has 'CrrPrmtAccDoc' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'CrrPrmtAccId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
