package TMS::API::Core::FinInvoicePaymentItemStrict;
use Moose::Role;

has 'InvoiceItemId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'InvoicePaymentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
