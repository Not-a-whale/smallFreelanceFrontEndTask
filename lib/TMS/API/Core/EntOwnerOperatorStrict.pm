package TMS::API::Core::EntOwnerOperatorStrict;
use Moose::Role;

has 'BizId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');
has 'CarrierId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');

1;
