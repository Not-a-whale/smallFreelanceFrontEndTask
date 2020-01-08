package TMS::API::Core::InsToEntitySearch;
use Moose::Role;

has 'AddedBy'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'EntityId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'InsId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
