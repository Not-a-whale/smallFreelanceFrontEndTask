package TMS::API::Core::CmmPackageTierSearch;
use Moose::Role;

has 'Name'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Package'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Percentage' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');

1;
