package TMS::API::Core::FinInvoicePaymentStrict;
use Moose::Role;

has 'Amount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'Valid'  => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '1');

1;
