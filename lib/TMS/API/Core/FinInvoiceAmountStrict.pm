package TMS::API::Core::FinInvoiceAmountStrict;
use Moose::Role;

has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'InvoiceId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'PaymentTermsId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
