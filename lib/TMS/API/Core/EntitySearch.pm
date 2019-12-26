package TMS::API::Core::EntitySearch;
use Moose::Role;

has 'IsActive' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');

1;
