package TMS::API::Core::InvTiresizeSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar16', 'coerce' => '1', 'required' => '0');
has 'Type' => ('is' => 'rw', 'isa' => 'set_Type',  'coerce' => '1', 'required' => '0');

1;
