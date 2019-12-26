package TMS::API::Core::EntOwnerOperatorStrict;
use Moose::Role;

has 'BizId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');
has 'CarrierId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');

1;
