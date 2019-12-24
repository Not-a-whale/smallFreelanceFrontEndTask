package TMS::API::Core::InsPolicyStrict;
use Moose::Role;

has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'InsuredAmount'  => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '1');
has 'PolicyNumber'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'ProviderAgent'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'TagName'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
