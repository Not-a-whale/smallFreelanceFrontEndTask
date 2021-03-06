package TMS::API::Core::HrPayrateStrict;
use Moose::Role;

has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '1');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '1');
has 'RateAmount'     => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'RateType'       => ('is' => 'rw', 'isa' => 'enum_RateType', 'coerce' => '1', 'required' => '1', 'default' => 'hourly');

1;
