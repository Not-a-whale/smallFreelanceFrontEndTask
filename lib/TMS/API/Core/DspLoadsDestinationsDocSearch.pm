package TMS::API::Core::DspLoadsDestinationsDocSearch;
use Moose::Role;

has 'ApprovedBy'        => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'FileId'            => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'LoadDestinationId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'Verified'          => ('is' => 'rw', 'isa' => 'Any',         'required' => '0');

1;
