package TMS::API::Core::HrPayrateSearch;
use Moose::Role;

has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'RateAmount'     => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'RateType'       => ('is' => 'rw', 'isa' => 'enum_RateType', 'coerce' => '1', 'required' => '0');

1;
