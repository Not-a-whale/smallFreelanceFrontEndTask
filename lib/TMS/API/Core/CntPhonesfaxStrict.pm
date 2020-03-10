package TMS::API::Core::CntPhonesfaxStrict;
use Moose::Role;

has 'Number'    => ('is' => 'rw', 'isa' => 'PhoneNumber',   'coerce' => '1', 'required' => '1');
has 'Extension' => ('is' => 'rw', 'isa' => 'PhoneExt',      'coerce' => '1', 'required' => '1', 'default' => '0');
has 'Features'  => ('is' => 'rw', 'isa' => 'set_Features',  'coerce' => '1', 'required' => '1', 'default' => 'VOICE');
has 'Mobility'  => ('is' => 'rw', 'isa' => 'enum_Mobility', 'coerce' => '1', 'required' => '1', 'default' => 'LAND LINE');

1;
