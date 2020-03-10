package TMS::API::Core::CrrIftaStrict;
use Moose::Role;

has 'Effective'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'Expiration'  => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'IFTALicense' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');
has 'McAccount'   => ('is' => 'rw', 'isa' => 'MCnum',      'coerce' => '1', 'required' => '1');
has 'State'       => ('is' => 'rw', 'isa' => 'VarChar2',   'coerce' => '1', 'required' => '1');

1;
