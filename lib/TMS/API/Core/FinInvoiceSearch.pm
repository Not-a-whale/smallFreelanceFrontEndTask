package TMS::API::Core::FinInvoiceSearch;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '0');

1;
