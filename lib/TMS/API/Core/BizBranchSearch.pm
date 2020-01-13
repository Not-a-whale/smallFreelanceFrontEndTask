package TMS::API::Core::BizBranchSearch;
use Moose::Role;

has 'OfficeName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
