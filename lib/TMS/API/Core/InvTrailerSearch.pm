package TMS::API::Core::InvTrailerSearch;
use Moose::Role;

has 'TrailerId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
