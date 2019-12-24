package TMS::API::Core::CrrPermitImageSearch;
use Moose::Role;

has 'PermtImageId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'StatePrmtId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
