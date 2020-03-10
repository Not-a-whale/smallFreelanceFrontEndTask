package TMS::API::Core::GenFileStrict;
use Moose::Role;

has 'FileData' => ('is' => 'rw', 'isa' => 'Blob',   'coerce' => '1', 'required' => '1');
has 'SHASIG'   => ('is' => 'rw', 'isa' => 'Sha256', 'coerce' => '1', 'required' => '1');

1;
