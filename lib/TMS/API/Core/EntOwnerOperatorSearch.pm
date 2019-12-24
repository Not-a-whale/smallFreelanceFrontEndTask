package TMS::API::Core::EntOwnerOperatorSearch;
use Moose::Role;

has 'BizId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'CarrierId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');

1;
