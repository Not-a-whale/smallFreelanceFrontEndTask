package TMS::API::Core::InvTrailerTypeSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
