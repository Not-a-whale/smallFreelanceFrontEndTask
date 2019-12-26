package TMS::API::Core::CntPhonesfaxSearch;
use Moose::Role;

has 'Number'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Extension' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Features'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'Mobility'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');

1;
