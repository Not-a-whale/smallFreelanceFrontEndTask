package TMS::API::Core::GenFileStrict;
use Moose::Role;

has 'FileData' => ('is' => 'rw', 'isa' => 'Any', 'required' => '1');
has 'SHASIG' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
