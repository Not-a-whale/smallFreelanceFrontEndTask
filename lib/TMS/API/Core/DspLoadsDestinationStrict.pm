package TMS::API::Core::DspLoadsDestinationStrict;
use Moose::Role;

has 'AppointmentStart' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'AppointmentType'  => ('is' => 'rw', 'isa' => 'Any',              'required' => '1');
has 'Branch'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Commodity'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'LoadId'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'PU_PO'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'StopType'         => ('is' => 'rw', 'isa' => 'Any',              'required' => '1');

1;
