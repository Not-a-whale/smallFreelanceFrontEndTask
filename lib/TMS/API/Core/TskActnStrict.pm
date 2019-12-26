package TMS::API::Core::TskActnStrict;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'tskid'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
