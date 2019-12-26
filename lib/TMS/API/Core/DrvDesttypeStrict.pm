package TMS::API::Core::DrvDesttypeStrict;
use Moose::Role;

has 'DestName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
