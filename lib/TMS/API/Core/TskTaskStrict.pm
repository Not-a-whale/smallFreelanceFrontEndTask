package TMS::API::Core::TskTaskStrict;
use Moose::Role;

has 'name'     => ('is' => 'rw', 'isa' => 'VarChar255',  'coerce' => '1', 'required' => '1');
has 'priority' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0', 'default' => '0');
has 'severity' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0', 'default' => '0');

1;
