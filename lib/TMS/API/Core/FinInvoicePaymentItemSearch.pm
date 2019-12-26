package TMS::API::Core::FinInvoicePaymentItemSearch;
use Moose::Role;

has 'InvoiceItemId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'InvoicePaymentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
