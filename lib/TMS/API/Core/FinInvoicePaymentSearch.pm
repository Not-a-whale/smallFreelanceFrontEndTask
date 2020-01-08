package TMS::API::Core::FinInvoicePaymentSearch;
use Moose::Role;

has 'Amount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'Valid'  => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0');

1;
