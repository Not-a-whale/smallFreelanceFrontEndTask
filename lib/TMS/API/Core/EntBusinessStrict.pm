package TMS::API::Core::EntBusinessStrict;
use Moose::Role;

has 'BizName' => ('is' => 'rw', 'isa' => 'UpperCaseStr', 'coerce' => '1', 'required' => '1');

1;
