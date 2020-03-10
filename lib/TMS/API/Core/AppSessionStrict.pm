package TMS::API::Core::AppSessionStrict;
use Moose::Role;

has 'session_name' => ('is' => 'rw', 'isa' => 'VarChar40', 'coerce' => '1', 'required' => '1');
has 'created_on'  => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '0', 'default' => 'SCALAR(0x81f28a408)');
has 'last_active' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'SCALAR(0x81f28a4b0)');

1;
