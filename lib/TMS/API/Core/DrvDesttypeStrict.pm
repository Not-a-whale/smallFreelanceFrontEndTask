package TMS::API::Core::DrvDesttypeStrict;
use Moose::Role;

has 'DestName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
