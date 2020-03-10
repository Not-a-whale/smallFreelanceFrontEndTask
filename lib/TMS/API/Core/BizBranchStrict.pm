package TMS::API::Core::BizBranchStrict;
use Moose::Role;

has 'OfficeName' => ('is' => 'rw', 'isa' => 'UpperCaseStr', 'coerce' => '1', 'required' => '1', 'default' => '');

1;
