package TMS::API::Core::BizCompanyNodeSearch;
use Moose::Role;

has 'UnitName' => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');
has 'UnitType' => ('is' => 'rw', 'isa' => 'enum_UnitType', 'coerce' => '1', 'required' => '0');

1;
