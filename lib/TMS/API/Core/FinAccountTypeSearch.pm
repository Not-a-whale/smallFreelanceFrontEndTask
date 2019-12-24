package TMS::API::Core::FinAccountTypeSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
