package TMS::API::Core::FinInvoiceSearch;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '0');

1;
