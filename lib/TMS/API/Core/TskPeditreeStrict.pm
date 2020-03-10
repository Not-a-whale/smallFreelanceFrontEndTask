package TMS::API::Core::TskPeditreeStrict;
use Moose::Role;

has 'Child'  => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');
has 'Parent' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
