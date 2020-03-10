package TMS::API::Core::AppFeatureStrict;
use Moose::Role;

has 'Method' => ('is' => 'rw', 'isa' => 'enum_Method', 'coerce' => '1', 'required' => '1');
has 'Name'   => ('is' => 'rw', 'isa' => 'VarChar64',   'coerce' => '1', 'required' => '1');
has 'Route'  => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '1');

1;
