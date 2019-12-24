package TMS::API::Core::HrPayrateSearch;
use Moose::Role;

has 'Agreement'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'AstId'          => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'RateAmount'     => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');

1;
