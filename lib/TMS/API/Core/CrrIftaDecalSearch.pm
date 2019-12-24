package TMS::API::Core::CrrIftaDecalSearch;
use Moose::Role;

has 'DecalImg'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'DecalNo'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'IftaAcctId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'VehicleId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
