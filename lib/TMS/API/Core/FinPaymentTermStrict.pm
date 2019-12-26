package TMS::API::Core::FinPaymentTermStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Type' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1');

1;
