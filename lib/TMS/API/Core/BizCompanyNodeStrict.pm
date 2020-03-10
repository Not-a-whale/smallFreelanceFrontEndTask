package TMS::API::Core::BizCompanyNodeStrict;
use Moose::Role;

has 'UnitName' => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '1');
has 'UnitType' => ('is' => 'rw', 'isa' => 'enum_UnitType', 'coerce' => '1', 'required' => '1', 'default' => 'Other');

1;
