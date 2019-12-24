package TMS::API::Core::BizCompanyNodeStrict;
use Moose::Role;

has 'UnitName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
