package TMS::API::Core::TskTreeSearch;
use Moose::Role;

has 'length' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
