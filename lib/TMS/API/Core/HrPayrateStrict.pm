package TMS::API::Core::HrPayrateStrict;
use Moose::Role;

has 'Agreement'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'AstId'          => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '1');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '1');
has 'RateAmount'     => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '1');

1;
