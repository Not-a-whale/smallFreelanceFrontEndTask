package TMS::API::Core::BizCompanyNodeSearch;
use Moose::Role;

has 'UnitName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
