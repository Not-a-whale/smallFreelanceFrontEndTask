package TMS::API::Core::FinAccountTypeStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
