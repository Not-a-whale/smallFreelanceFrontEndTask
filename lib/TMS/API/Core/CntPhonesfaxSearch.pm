package TMS::API::Core::CntPhonesfaxSearch;
use Moose::Role;

has 'Number' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
