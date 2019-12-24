package TMS::API::Core::FinPaymentMethodSearch;
use Moose::Role;

has 'PaymentMethodId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
