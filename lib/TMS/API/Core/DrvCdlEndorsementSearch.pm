package TMS::API::Core::DrvCdlEndorsementSearch;
use Moose::Role;

has 'Endorsement'   => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');
has 'ExpiredDate'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'ValidFromDate' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');

1;
