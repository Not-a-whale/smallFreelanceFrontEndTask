package TMS::API::Core::FinItemTemplatesTypeStrict;
use Moose::Role;

has 'Description' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Name'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
