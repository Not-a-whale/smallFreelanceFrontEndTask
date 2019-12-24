package TMS::API::Core::DrvDriverlicenceSearch;
use Moose::Role;

has 'DrLcDateExpired' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DrLcDateValid'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DrLcSate'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'DrLicNumber'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'DriverId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Photo'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
