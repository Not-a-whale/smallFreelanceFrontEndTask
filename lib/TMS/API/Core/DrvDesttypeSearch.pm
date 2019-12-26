package TMS::API::Core::DrvDesttypeSearch;
use Moose::Role;

has 'DestName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
