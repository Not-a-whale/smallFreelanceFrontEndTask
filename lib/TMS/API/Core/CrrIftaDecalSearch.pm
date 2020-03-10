package TMS::API::Core::CrrIftaDecalSearch;
use Moose::Role;

has 'DecalNo'        => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');
has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');

1;
