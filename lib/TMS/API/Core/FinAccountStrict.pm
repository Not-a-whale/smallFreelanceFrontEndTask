package TMS::API::Core::FinAccountStrict;
use Moose::Role;

has 'Name'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Active'      => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');
has 'Balance'     => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '1', 'default' => '0.00');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');
has 'Valid'       => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');

1;
