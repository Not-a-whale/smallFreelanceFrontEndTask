package TMS::API::Core::FinPaymentMethodStrict;
use Moose::Role;

has 'PaymentMethodName' => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '1');

1;
