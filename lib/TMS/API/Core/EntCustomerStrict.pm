package TMS::API::Core::EntCustomerStrict;
use Moose::Role;

has 'CstmrId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
