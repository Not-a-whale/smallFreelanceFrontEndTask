package TMS::API::Core::EntCustomerStrict;
use Moose::Role;

has 'CstmrId'          => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');
has 'RequireOriginals' => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '0');

1;
