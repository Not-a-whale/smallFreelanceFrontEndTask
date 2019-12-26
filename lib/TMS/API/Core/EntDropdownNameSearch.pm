package TMS::API::Core::EntDropdownNameSearch;
use Moose::Role;

has 'Id'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'WhatAmI' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
