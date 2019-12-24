package TMS::API::Core::InsToEntityStrict;
use Moose::Role;

has 'AddedBy'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'DateAdded' => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '1');
has 'EntityId'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'InsEntId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');
has 'InsId'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');

1;
