package TMS::API::Core::EntBusinessSearch;
use Moose::Role;

has 'BizName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
