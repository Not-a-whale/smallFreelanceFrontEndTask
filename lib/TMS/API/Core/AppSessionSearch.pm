package TMS::API::Core::AppSessionSearch;
use Moose::Role;

has 'session_data' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'session_name' => ('is' => 'rw', 'isa' => 'VarChar40',        'coerce' => '1', 'required' => '0');

1;
