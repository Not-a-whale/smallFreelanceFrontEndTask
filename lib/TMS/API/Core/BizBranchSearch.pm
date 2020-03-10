package TMS::API::Core::BizBranchSearch;
use Moose::Role;

has 'OfficeName' => ('is' => 'rw', 'isa' => 'UpperCaseStr', 'coerce' => '1', 'required' => '0');

1;
