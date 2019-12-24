package TMS::API::Core::FinInvoiceSearch;
use Moose::Role;

has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'InvoiceId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'PaymentTermsId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');

1;
