package TMS::API::Core::TskPeditreeSearch;
use Moose::Role;

has 'Child'  => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');
has 'Parent' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
