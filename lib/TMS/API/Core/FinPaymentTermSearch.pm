package TMS::API::Core::FinPaymentTermSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Type' => ('is' => 'rw', 'isa' => 'Any', 'required' => '0');

1;
