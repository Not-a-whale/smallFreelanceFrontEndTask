package TMS::API::Core::DspLoadsDocStrict;
use Moose::Role;

has 'AddedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'FileId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'LoadId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
