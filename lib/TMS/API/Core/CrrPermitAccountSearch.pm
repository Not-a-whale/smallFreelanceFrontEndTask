package TMS::API::Core::CrrPermitAccountSearch;
use Moose::Role;

has 'AccountNo' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'CarrierId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'State'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
