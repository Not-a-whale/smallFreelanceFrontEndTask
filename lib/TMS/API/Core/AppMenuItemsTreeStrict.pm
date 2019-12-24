package TMS::API::Core::AppMenuItemsTreeStrict;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');
has 'Depth'        => ('is' => 'rw', 'isa' => 'Int',           'required' => '1');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
