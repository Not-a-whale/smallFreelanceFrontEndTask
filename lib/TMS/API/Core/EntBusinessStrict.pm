package TMS::API::Core::EntBusinessStrict;
use Moose::Role;

has 'BizName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
