package TMS::API::Core::DrvDriverlicenceStrict;
use Moose::Role;

has 'DrLcDateExpired' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'DrLcDateValid'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'DrLcSate'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'DrLicNumber'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'DriverId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'Photo'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');

1;
