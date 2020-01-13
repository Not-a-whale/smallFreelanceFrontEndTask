package TMS::API::Core::FinInvoicesItemStrict;
use Moose::Role;

has 'Quantity' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1', 'default' => '1');

1;
