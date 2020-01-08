package TMS::API::Core::EntCustomerSearch;
use Moose::Role;

has 'RequireOriginals' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');

1;
