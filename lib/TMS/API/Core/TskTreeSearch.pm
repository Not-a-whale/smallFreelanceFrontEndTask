package TMS::API::Core::TskTreeSearch;
use Moose::Role;

has 'ancestor'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'descendant' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'length'     => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');

1;
