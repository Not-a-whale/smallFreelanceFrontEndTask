package TMS::API::Core::CrrPermitAccountSearch;
use Moose::Role;

has 'AccountNo' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');
has 'State'     => ('is' => 'rw', 'isa' => 'VarChar2',   'coerce' => '1', 'required' => '0');

1;
