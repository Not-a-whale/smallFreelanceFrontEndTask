package TMS::API::Core::AppSessionStrict;
use Moose::Role;

has 'session_data' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'session_name' => ('is' => 'rw', 'isa' => 'VarChar40', 'coerce' => '1', 'required' => '1');
has 'created_on'  => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'SCALAR(0x81e469270)');
has 'last_active' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'SCALAR(0x81e4691c8)');

1;
