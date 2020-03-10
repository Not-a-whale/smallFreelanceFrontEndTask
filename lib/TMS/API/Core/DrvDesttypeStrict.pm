package TMS::API::Core::DrvDesttypeStrict;
use Moose::Role;

has 'DestName' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
