package TMS::API::Core::DspLoadStrict;
use Moose::Role;

has 'Comodotiy'       => ('is' => 'rw', 'isa' => 'VarChar64',            'coerce' => '1', 'required' => '1');
has 'LoadRate'        => ('is' => 'rw', 'isa' => 'CurrencyValue',        'coerce' => '1', 'required' => '1');
has 'DistanceUnit'    => ('is' => 'rw', 'isa' => 'enum_DistanceUnit',    'coerce' => '1', 'required' => '1', 'default' => 'mi');
has 'TemperatureUnit' => ('is' => 'rw', 'isa' => 'enum_TemperatureUnit', 'coerce' => '1', 'required' => '1', 'default' => 'F');
has 'WeightUnit'      => ('is' => 'rw', 'isa' => 'enum_WeightUnit',      'coerce' => '1', 'required' => '1', 'default' => 'lbs');

1;
