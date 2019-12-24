package TMS::API::Core::FinInvoiceStrict;
use Moose::Role;

has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'InvoiceId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');
has 'PaymentTermsId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');

1;
