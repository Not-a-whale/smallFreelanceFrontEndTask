package TMS::API::Core::DrvMedcardStrict;
use Moose::Role;

has 'DriverId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'Photo'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
