package TMS::API::Core::AppSessionStrict;
use Moose::Role;

has 'session_data' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'session_name' => ('is' => 'rw', 'isa' => 'VarChar40',        'coerce' => '1', 'required' => '1');

1;
