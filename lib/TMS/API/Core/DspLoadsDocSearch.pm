package TMS::API::Core::DspLoadsDocSearch;
use Moose::Role;

has 'AddedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'FileId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'LoadId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
