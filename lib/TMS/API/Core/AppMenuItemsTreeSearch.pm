package TMS::API::Core::AppMenuItemsTreeSearch;
use Moose::Role;

has 'Depth' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
