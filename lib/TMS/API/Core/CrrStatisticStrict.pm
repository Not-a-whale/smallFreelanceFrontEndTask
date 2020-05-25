package TMS::API::Core::CrrStatisticStrict;
use Moose::Role;

has 'HmFlag' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');
has 'PcFlag' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');

1;
