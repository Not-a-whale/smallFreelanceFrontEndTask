package TMS::API::Core::FinPaymentMethodStrict;
use Moose::Role;

has 'PaymentMethodId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');

1;
