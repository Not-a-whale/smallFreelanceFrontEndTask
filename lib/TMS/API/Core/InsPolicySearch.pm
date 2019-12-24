package TMS::API::Core::InsPolicySearch;
use Moose::Role;

has 'EffectiveDate'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'ExpirationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'InsuredAmount'  => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'PolicyNumber'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ProviderAgent'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'TagName'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
