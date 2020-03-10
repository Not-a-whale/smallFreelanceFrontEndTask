package TMS::API::Core::TskTaskSearch;
use Moose::Role;

has 'name'     => ('is' => 'rw', 'isa' => 'VarChar255',  'coerce' => '1', 'required' => '0');
has 'priority' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'severity' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
