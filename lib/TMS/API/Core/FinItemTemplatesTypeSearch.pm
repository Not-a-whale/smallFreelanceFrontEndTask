package TMS::API::Core::FinItemTemplatesTypeSearch;
use Moose::Role;

has 'Description' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Name'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
