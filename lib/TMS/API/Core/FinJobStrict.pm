package TMS::API::Core::FinJobStrict;
use Moose::Role;

has 'JobAddedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
