package TMS::API::Core::SftElogStatStrict;
use Moose::Role;

has 'EquipmentId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Latitude'           => ('is' => 'rw', 'isa' => 'Float',            'required' => '1');
has 'LocationProviderId' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Longitude'          => ('is' => 'rw', 'isa' => 'Float',            'required' => '1');

1;
