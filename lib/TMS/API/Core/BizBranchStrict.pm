package TMS::API::Core::BizBranchStrict;
use Moose::Role;

has 'BizId'        => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'BrnchAddress' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'BrnchPhone'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'OfficeName'   => ('is' => 'rw', 'isa' => 'TidySpacesString',  'coerce' => '1', 'required' => '1', 'default' => '');

1;
