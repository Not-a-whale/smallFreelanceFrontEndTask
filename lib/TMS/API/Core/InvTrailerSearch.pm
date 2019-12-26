package TMS::API::Core::InvTrailerSearch;
use Moose::Role;

has 'TrailerId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
