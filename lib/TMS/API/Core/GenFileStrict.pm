package TMS::API::Core::GenFileStrict;
use Moose::Role;

has 'FileData' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1');
has 'SHASIG' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
