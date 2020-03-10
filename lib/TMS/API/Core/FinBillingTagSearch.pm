package TMS::API::Core::FinBillingTagSearch;
use Moose::Role;

has 'BillingTag'  => ('is' => 'rw', 'isa' => 'VarChar45', 'coerce' => '1', 'required' => '0');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '0');

1;
