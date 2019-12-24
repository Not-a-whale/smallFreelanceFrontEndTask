package TMS::API::Core::FinPaymentTermStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Type' => ('is' => 'rw', 'isa' => 'Any', 'required' => '1');

1;
