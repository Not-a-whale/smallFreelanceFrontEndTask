package TMS::API::Core::FinAccountSearch;
use Moose::Role;

has 'Name'        => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');
has 'Active'      => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0');
has 'Balance'     => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0');
has 'Valid'       => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0');

1;
