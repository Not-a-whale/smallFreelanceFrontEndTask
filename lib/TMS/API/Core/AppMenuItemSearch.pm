package TMS::API::Core::AppMenuItemSearch;
use Moose::Role;

has 'Label'     => ('is' => 'rw', 'isa' => 'VarChar32',     'coerce' => '1', 'required' => '0');
has 'Enabled'   => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0');
has 'Route'     => ('is' => 'rw', 'isa' => 'VarChar1024',   'coerce' => '1', 'required' => '0');
has 'SortIndex' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');

1;
