package TMS::API::Core::BizCompanyNodeStrict;
use Moose::Role;

has 'UnitName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
