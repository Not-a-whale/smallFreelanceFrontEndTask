package TMS::API::Core::FinInvoicesItemSearch;
use Moose::Role;

has 'Quantity' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
