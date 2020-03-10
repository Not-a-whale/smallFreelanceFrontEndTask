package TMS::API::Core::TskTreeStrict;
use Moose::Role;

has 'length' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1', 'default' => '0');

1;
