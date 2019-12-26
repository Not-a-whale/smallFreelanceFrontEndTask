package TMS::API::Core::GenFileSearch;
use Moose::Role;

has 'FileData' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '0');
has 'SHASIG' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
