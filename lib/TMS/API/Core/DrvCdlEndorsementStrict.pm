package TMS::API::Core::DrvCdlEndorsementStrict;
use Moose::Role;

has 'Endorsement'   => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');
has 'ExpiredDate'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'ValidFromDate' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');

1;
