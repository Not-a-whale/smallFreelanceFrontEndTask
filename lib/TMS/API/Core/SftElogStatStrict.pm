package TMS::API::Core::SftElogStatStrict;
use Moose::Role;

has 'EquipmentId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'Latitude'           => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '1');
has 'LocationProviderId' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Longitude'          => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '1');

1;
