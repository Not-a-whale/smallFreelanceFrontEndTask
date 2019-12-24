package TMS::API::Core::FinInvoicePaymentStrict;
use Moose::Role;

has 'Amount'          => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '1');
has 'InvoiceId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'PayerId'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'PaymentMethodId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'TransactionId'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');

1;
