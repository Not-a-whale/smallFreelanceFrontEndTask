package TMS::API::Core::CmmPackageTierSearch;
use Moose::Role;

has 'Name'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Percentage' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');

1;
