package TMS::API::Core::EntPersonSearch;
use Moose::Role;

has 'FirstName'  => ('is' => 'rw', 'isa' => 'Person',        'coerce' => '1', 'required' => '0');
has 'LastName'   => ('is' => 'rw', 'isa' => 'Person',        'coerce' => '1', 'required' => '0');
has 'MiddleName' => ('is' => 'rw', 'isa' => 'PersonOrEmpty', 'coerce' => '1', 'required' => '0');
has 'NickName'   => ('is' => 'rw', 'isa' => 'PersonOrEmpty', 'coerce' => '1', 'required' => '0');
has 'Prefix'     => ('is' => 'rw', 'isa' => 'enum_Prefix',   'coerce' => '1', 'required' => '0');
has 'Suffix'     => ('is' => 'rw', 'isa' => 'enum_Suffix',   'coerce' => '1', 'required' => '0');

1;
