package TMS::API::Core::BizCompanyNodeSearch;
use Moose::Role;

has 'UnitName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
