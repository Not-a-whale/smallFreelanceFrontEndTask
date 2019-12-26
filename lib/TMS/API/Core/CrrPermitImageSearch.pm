package TMS::API::Core::CrrPermitImageSearch;
use Moose::Role;

has 'PermtImageId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'StatePrmtId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
