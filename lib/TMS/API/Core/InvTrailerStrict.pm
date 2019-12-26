package TMS::API::Core::InvTrailerStrict;
use Moose::Role;

has 'TrailerId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
