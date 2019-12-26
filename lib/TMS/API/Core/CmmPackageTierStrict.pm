package TMS::API::Core::CmmPackageTierStrict;
use Moose::Role;

has 'Name'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Package'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Percentage' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '1');

1;
