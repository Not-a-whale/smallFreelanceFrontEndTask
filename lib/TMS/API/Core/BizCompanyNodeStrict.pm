package TMS::API::Core::BizCompanyNodeStrict;
use Moose::Role;

has 'UnitName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Type' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'Other');

1;
