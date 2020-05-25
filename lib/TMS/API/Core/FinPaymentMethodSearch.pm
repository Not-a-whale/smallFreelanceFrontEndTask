package TMS::API::Core::FinPaymentMethodSearch;
use Moose::Role;

has 'PaymentMethodName' => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '0');

1;
