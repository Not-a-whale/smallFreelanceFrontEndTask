package TMS::API::Core::InsPolicyStrict;
use Moose::Role;

has 'EffectiveDate'     => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '1');
has 'ExpirationDate'    => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '1');
has 'InsuredAmount'     => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'PolicyNumber'      => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '1');
has 'TagName'           => ('is' => 'rw', 'isa' => 'VarChar64',     'coerce' => '1', 'required' => '1');
has 'DownpaymentAmount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1', 'default' => '0.00');

1;
