package TMS::API::Core::FinJobStrict;
use Moose::Role;

has 'JobAddedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
