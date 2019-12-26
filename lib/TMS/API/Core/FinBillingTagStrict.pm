package TMS::API::Core::FinBillingTagStrict;
use Moose::Role;

has 'BillingTag'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');

1;
