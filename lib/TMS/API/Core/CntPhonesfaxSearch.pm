package TMS::API::Core::CntPhonesfaxSearch;
use Moose::Role;

has 'Number' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
