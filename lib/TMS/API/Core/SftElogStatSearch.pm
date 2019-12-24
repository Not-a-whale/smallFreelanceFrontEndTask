package TMS::API::Core::SftElogStatSearch;
use Moose::Role;

has 'EquipmentId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Latitude'           => ('is' => 'rw', 'isa' => 'Float',            'required' => '0');
has 'LocationProviderId' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Longitude'          => ('is' => 'rw', 'isa' => 'Float',            'required' => '0');

1;
