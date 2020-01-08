package TMS::API::Core::InsToEntityStrict;
use Moose::Role;

has 'AddedBy'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'EntityId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'InsId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
