package TMS::API::Core::CntPhonesfaxSearch;
use Moose::Role;

has 'Number'    => ('is' => 'rw', 'isa' => 'PhoneNumber',   'coerce' => '1', 'required' => '0');
has 'Extension' => ('is' => 'rw', 'isa' => 'PhoneExt',      'coerce' => '1', 'required' => '0');
has 'Features'  => ('is' => 'rw', 'isa' => 'set_Features',  'coerce' => '1', 'required' => '0');
has 'Mobility'  => ('is' => 'rw', 'isa' => 'enum_Mobility', 'coerce' => '1', 'required' => '0');

1;
