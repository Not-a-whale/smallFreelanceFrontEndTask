package TMS::API::Core::FinAccountSearch;
use Moose::Role;

has 'AccountTypeId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Name'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
