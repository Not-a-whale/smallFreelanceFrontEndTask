package TMS::API::Core::EntPersonStrict;
use Moose::Role;

has 'FirstName'  => ('is' => 'rw', 'isa' => 'Person',        'coerce' => '1', 'required' => '1');
has 'LastName'   => ('is' => 'rw', 'isa' => 'Person',        'coerce' => '1', 'required' => '1');
has 'MiddleName' => ('is' => 'rw', 'isa' => 'PersonOrEmpty', 'coerce' => '1', 'required' => '1', 'default' => '');
has 'NickName'   => ('is' => 'rw', 'isa' => 'PersonOrEmpty', 'coerce' => '1', 'required' => '1', 'default' => '');
has 'Prefix'     => ('is' => 'rw', 'isa' => 'enum_Prefix',   'coerce' => '1', 'required' => '1', 'default' => '');
has 'Suffix'     => ('is' => 'rw', 'isa' => 'enum_Suffix',   'coerce' => '1', 'required' => '1', 'default' => '');

1;
