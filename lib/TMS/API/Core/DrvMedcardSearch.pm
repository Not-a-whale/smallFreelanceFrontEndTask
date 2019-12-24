package TMS::API::Core::DrvMedcardSearch;
use Moose::Role;

has 'DriverId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'Photo'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
