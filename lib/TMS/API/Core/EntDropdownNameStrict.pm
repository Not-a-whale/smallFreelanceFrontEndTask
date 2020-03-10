package TMS::API::Core::EntDropdownNameStrict;
use Moose::Role;

has 'Id'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1', 'default' => '0');
has 'WhatAmI' => ('is' => 'rw', 'isa' => 'VarChar8',    'coerce' => '1', 'required' => '1', 'default' => '');

1;
