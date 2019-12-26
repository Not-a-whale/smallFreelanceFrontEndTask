package TMS::API::Core::SftElogStatSearch;
use Moose::Role;

has 'EquipmentId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Latitude'           => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');
has 'LocationProviderId' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Longitude'          => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');

1;
