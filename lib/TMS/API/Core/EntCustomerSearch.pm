package TMS::API::Core::EntCustomerSearch;
use Moose::Role;

has 'CstmrId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
