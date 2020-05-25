package TMS::API::Core::CrrStatisticSearch;
use Moose::Role;

has 'HmFlag' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');
has 'PcFlag' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');

1;
