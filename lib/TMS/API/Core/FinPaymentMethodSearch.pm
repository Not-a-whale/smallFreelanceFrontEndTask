package TMS::API::Core::FinPaymentMethodSearch;
use Moose::Role;

has 'PaymentMethodId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
