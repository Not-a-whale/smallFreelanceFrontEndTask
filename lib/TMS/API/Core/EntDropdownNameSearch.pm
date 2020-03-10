package TMS::API::Core::EntDropdownNameSearch;
use Moose::Role;

has 'Id'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'WhatAmI' => ('is' => 'rw', 'isa' => 'VarChar8',    'coerce' => '1', 'required' => '0');

1;
