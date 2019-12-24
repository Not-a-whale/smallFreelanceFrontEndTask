package TMS::API::Core::GenFileSearch;
use Moose::Role;

has 'FileData' => ('is' => 'rw', 'isa' => 'Any', 'required' => '0');
has 'SHASIG' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
