package TMS::API::Core::CrrPermitImageStrict;
use Moose::Role;

has 'PermtImageId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'StatePrmtId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
