package TMS::API::Core::FinAccountTypeStrict;
use Moose::Role;

has 'Name'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'BalanceSheet' => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');
has 'Credit'       => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '1', 'default' => '-1.00');
has 'Debit'        => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '1', 'default' => '1.00');
has 'Editable'     => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0', 'default' => '1');
has 'IncomeSheet'  => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '0');
has 'Temp'         => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0', 'default' => '0');
has 'UserDefined'  => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0', 'default' => '1');
has 'Valid'        => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '0');

1;
