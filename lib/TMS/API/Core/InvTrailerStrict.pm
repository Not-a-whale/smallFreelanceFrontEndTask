package TMS::API::Core::InvTrailerStrict;
use Moose::Role;

has 'TrailerId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
