package TMS::API::Core::DrvDesttypeSearch;
use Moose::Role;

has 'DestName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
