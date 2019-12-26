package TMS::API::Core::DspLoadsDestinationsDocStrict;
use Moose::Role;

has 'ApprovedBy'        => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'FileId'            => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'LoadDestinationId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'Verified'          => ('is' => 'rw', 'isa' => 'Any',         'coerce' => '0', 'required' => '1');
has 'FactoredDoc'       => ('is' => 'rw', 'isa' => 'BoolInt',     'coerce' => '1', 'required' => '1', 'default' => '0');

1;
