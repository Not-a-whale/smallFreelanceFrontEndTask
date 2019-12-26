package TMS::API::Core::FinInvoiceSearch;
use Moose::Role;

has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'InvoiceId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'PaymentTermsId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Status'         => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');

1;
