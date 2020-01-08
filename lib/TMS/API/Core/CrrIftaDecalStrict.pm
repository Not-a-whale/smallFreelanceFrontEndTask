package TMS::API::Core::CrrIftaDecalStrict;
use Moose::Role;

has 'DecalNo'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');

1;
