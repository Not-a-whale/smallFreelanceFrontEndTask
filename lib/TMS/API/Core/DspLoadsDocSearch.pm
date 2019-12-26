package TMS::API::Core::DspLoadsDocSearch;
use Moose::Role;

has 'AddedBy'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'FileId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'LoadId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'FactoredDoc' => ('is' => 'rw', 'isa' => 'BoolInt',     'coerce' => '1', 'required' => '0');

1;
