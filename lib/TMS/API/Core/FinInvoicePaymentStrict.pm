package TMS::API::Core::FinInvoicePaymentStrict;
use Moose::Role;

has 'Amount'          => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'InvoiceId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'PayerId'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'PaymentMethodId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'TransactionId'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');

1;
