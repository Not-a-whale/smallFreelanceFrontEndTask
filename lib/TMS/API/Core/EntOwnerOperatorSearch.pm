package TMS::API::Core::EntOwnerOperatorSearch;
use Moose::Role;

has 'BizId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'CarrierId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

1;
