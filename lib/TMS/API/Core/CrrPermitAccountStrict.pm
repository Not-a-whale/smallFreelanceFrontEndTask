package TMS::API::Core::CrrPermitAccountStrict;
use Moose::Role;

has 'AccountNo' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');
has 'State'     => ('is' => 'rw', 'isa' => 'VarChar2',   'coerce' => '1', 'required' => '1');

1;
