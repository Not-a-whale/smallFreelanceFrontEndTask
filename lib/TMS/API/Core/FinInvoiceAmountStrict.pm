package TMS::API::Core::FinInvoiceAmountStrict;
use Moose::Role;

has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'InvoiceId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'PaymentTermsId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'DateCreated' =>
    ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '1', 'default' => '0000-00-00 00:00:00');
has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'pending');

1;
