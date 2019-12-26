package TMS::API::Core::CntPhonesfaxStrict;
use Moose::Role;

has 'Number' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
