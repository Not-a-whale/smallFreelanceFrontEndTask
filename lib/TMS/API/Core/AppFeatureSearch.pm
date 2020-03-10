package TMS::API::Core::AppFeatureSearch;
use Moose::Role;

has 'Method' => ('is' => 'rw', 'isa' => 'enum_Method', 'coerce' => '1', 'required' => '0');
has 'Name'   => ('is' => 'rw', 'isa' => 'VarChar64',   'coerce' => '1', 'required' => '0');
has 'Route'  => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '0');

1;
