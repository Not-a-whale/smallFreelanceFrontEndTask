package TMS::API::Core::AppMenuItemWithDepthStrict;
use Moose::Role;

has 'Label'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Enabled'    => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0', 'default' => '1');
has 'MenuItemId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1', 'default' => '0');
has 'Route' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1', 'default' => 'tms.app.error');
has 'SortIndex' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0', 'default' => '0.000');

1;
