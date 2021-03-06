package TMS::API::Core::DrvDriverlicenceSearch;
use Moose::Role;

has 'DrLcDateExpired' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'DrLcDateValid'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'DrLcSate'        => ('is' => 'rw', 'isa' => 'VarChar2',   'coerce' => '1', 'required' => '0');
has 'DrLicNumber'     => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
