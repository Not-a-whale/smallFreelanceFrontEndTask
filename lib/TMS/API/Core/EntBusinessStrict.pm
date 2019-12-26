package TMS::API::Core::EntBusinessStrict;
use Moose::Role;

has 'BizName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
