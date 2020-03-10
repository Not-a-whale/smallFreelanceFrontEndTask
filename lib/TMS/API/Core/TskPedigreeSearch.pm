package TMS::API::Core::TskPedigreeSearch;
use Moose::Role;

has 'Child'      => ('is' => 'rw', 'isa' => 'VarChar255',  'coerce' => '1', 'required' => '0');
has 'Parent'     => ('is' => 'rw', 'isa' => 'VarChar255',  'coerce' => '1', 'required' => '0');
has 'ancestor'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'descendant' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'length'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
