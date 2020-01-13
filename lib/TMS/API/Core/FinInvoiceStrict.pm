package TMS::API::Core::FinInvoiceStrict;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'pending');

1;
