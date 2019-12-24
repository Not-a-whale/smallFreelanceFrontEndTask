package TMS::API::Core::CrrPermitAccountStrict;
use Moose::Role;

has 'AccountNo' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'CarrierId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'State'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
