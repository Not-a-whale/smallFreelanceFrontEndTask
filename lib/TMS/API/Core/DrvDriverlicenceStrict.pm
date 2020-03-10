package TMS::API::Core::DrvDriverlicenceStrict;
use Moose::Role;

has 'DrLcDateExpired' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'DrLcDateValid'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'DrLcSate'        => ('is' => 'rw', 'isa' => 'VarChar2',   'coerce' => '1', 'required' => '1');
has 'DrLicNumber'     => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
