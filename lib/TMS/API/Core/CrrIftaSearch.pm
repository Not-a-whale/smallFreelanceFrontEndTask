package TMS::API::Core::CrrIftaSearch;
use Moose::Role;

has 'Effective'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'Expiration'  => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'IFTALicense' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');
has 'McAccount'   => ('is' => 'rw', 'isa' => 'MCnum',      'coerce' => '1', 'required' => '0');
has 'State'       => ('is' => 'rw', 'isa' => 'VarChar2',   'coerce' => '1', 'required' => '0');

1;
