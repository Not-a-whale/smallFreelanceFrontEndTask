package TMS::API::Core::FinPaymentMethodStrict;
use Moose::Role;

has 'PaymentMethodId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
