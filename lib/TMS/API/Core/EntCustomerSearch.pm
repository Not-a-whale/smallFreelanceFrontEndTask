package TMS::API::Core::EntCustomerSearch;
use Moose::Role;

has 'CstmrId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
