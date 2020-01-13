package TMS::API::Core::EntCustomerStrict;
use Moose::Role;

has 'RequireOriginals' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');

1;
