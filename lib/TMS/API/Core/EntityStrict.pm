package TMS::API::Core::EntityStrict;
use Moose::Role;

has 'IsActive' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '1');

1;
