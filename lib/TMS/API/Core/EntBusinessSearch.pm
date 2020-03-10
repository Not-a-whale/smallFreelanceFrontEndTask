package TMS::API::Core::EntBusinessSearch;
use Moose::Role;

has 'BizName' => ('is' => 'rw', 'isa' => 'UpperCaseStr', 'coerce' => '1', 'required' => '0');

1;
