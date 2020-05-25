package TMS::API::Core::DspLoadSearch;
use Moose::Role;

has 'Comodotiy'       => ('is' => 'rw', 'isa' => 'VarChar64',            'coerce' => '1', 'required' => '0');
has 'LoadRate'        => ('is' => 'rw', 'isa' => 'CurrencyValue',        'coerce' => '1', 'required' => '0');
has 'DistanceUnit'    => ('is' => 'rw', 'isa' => 'enum_DistanceUnit',    'coerce' => '1', 'required' => '0');
has 'TemperatureUnit' => ('is' => 'rw', 'isa' => 'enum_TemperatureUnit', 'coerce' => '1', 'required' => '0');
has 'WeightUnit'      => ('is' => 'rw', 'isa' => 'enum_WeightUnit',      'coerce' => '1', 'required' => '0');

1;
