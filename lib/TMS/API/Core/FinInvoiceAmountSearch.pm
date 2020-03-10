package TMS::API::Core::FinInvoiceAmountSearch;
use Moose::Role;

has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'InvoiceId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'PaymentTermsId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'DateCreated'    => ('is' => 'rw', 'isa' => 'DATETIME',    'coerce' => '1', 'required' => '0');
has 'Status'         => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '0');

1;
