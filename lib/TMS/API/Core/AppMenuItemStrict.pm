package TMS::API::Core::AppMenuItemStrict;
use Moose::Role;

has 'Label'     => ('is' => 'rw', 'isa' => 'VarChar32',     'coerce' => '1', 'required' => '1');
has 'Enabled'   => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0', 'default' => '1');
has 'Route'     => ('is' => 'rw', 'isa' => 'VarChar1024',   'coerce' => '1', 'required' => '1', 'default' => 'tms.app.error');
has 'SortIndex' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0', 'default' => '0.000');

1;
