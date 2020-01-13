package TMS::API::Core::InsPolicySearch;
use Moose::Role;

has 'EffectiveDate'     => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'ExpirationDate'    => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'InsuredAmount'     => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');
has 'PolicyNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'TagName'           => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'DownpaymentAmount' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');

1;
