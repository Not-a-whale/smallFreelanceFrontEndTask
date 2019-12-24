package TMS::API::Core::FinAccountStrict;
use Moose::Role;

has 'AccountTypeId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Name'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
