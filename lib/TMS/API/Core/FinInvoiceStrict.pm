package TMS::API::Core::FinInvoiceStrict;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '1', 'default' => 'pending');

1;
