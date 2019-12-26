package TMS::API::Core::AppMenuItemsTreeSearch;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'Depth'        => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
