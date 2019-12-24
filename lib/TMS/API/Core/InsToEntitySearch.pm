package TMS::API::Core::InsToEntitySearch;
use Moose::Role;

has 'AddedBy'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'DateAdded' => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'EntityId'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'InsEntId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'InsId'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');

1;
