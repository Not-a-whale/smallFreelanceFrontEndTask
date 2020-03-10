package TMS::API::Core::GenFileSearch;
use Moose::Role;

has 'FileData' => ('is' => 'rw', 'isa' => 'Blob',   'coerce' => '1', 'required' => '0');
has 'SHASIG'   => ('is' => 'rw', 'isa' => 'Sha256', 'coerce' => '1', 'required' => '0');

1;
