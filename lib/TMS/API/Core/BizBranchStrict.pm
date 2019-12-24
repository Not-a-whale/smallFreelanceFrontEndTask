package TMS::API::Core::BizBranchStrict;
use Moose::Role;

has 'BizId'        => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'BrnchAddress' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'BrnchPhone'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
