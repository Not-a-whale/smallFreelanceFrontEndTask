package TMS::API::Core::TskRespStrict;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'tskid'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
