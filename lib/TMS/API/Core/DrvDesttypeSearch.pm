package TMS::API::Core::DrvDesttypeSearch;
use Moose::Role;

has 'DestName' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
