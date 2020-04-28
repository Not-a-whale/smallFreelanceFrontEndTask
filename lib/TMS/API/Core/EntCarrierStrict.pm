package TMS::API::Core::EntCarrierStrict;
use Moose::Role;

has 'HmFlag' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');
has 'PcFlag' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');

1;
