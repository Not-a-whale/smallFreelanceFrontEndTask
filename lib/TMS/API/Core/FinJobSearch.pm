package TMS::API::Core::FinJobSearch;
use Moose::Role;

has 'JobAddedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
