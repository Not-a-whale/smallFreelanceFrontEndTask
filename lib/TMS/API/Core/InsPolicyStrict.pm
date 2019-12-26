package TMS::API::Core::InsPolicyStrict;
use Moose::Role;

has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'InsuredAmount'  => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '1');
has 'PolicyNumber'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'ProviderAgent'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'TagName'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
