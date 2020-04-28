package TMS::API::Core::EntCarrierSearch;
use Moose::Role;

has 'HmFlag' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');
has 'PcFlag' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');

1;
