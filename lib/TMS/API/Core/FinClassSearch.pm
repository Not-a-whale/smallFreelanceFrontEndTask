package TMS::API::Core::FinClassSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
