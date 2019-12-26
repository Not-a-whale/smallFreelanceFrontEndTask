package TMS::API::Core::CrrIftaDecalStrict;
use Moose::Role;

has 'DecalImg'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'DecalNo'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'IftaAcctId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'VehicleId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');

1;
