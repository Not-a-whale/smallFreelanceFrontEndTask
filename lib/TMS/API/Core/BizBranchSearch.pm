package TMS::API::Core::BizBranchSearch;
use Moose::Role;

has 'BizId'        => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'BrnchAddress' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'BrnchPhone'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
