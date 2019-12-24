package TMS::API::Core::TskRespSearch;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'tskid'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
