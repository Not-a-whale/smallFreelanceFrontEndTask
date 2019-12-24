package TMS::API::Core::TskTreeSearch;
use Moose::Role;

has 'ancestor'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'descendant' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
