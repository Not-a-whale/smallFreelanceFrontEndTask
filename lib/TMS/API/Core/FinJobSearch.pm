package TMS::API::Core::FinJobSearch;
use Moose::Role;

has 'JobAddedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
