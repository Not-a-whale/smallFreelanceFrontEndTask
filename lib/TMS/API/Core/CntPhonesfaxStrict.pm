package TMS::API::Core::CntPhonesfaxStrict;
use Moose::Role;

has 'Number' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
