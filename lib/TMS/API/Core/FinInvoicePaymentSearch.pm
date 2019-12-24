package TMS::API::Core::FinInvoicePaymentSearch;
use Moose::Role;

has 'Amount'          => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');
has 'InvoiceId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'PayerId'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'PaymentMethodId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'TransactionId'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');

1;
