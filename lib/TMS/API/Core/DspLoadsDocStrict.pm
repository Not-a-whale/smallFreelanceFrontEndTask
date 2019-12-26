package TMS::API::Core::DspLoadsDocStrict;
use Moose::Role;

has 'AddedBy'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'FileId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'LoadId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'FactoredDoc' => ('is' => 'rw', 'isa' => 'BoolInt',     'coerce' => '1', 'required' => '1', 'default' => '0');

1;
