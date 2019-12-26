package TMS::API::Core::TskTreeStrict;
use Moose::Role;

has 'ancestor'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'descendant' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'length'     => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '1', 'default' => '0');

1;
