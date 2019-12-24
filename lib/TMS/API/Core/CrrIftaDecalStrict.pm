package TMS::API::Core::CrrIftaDecalStrict;
use Moose::Role;

has 'DecalImg'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'DecalNo'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'IftaAcctId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'VehicleId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
