package TMS::API::Core::InvTrailerTypeSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
