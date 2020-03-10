package TMS::API::Core::TskAlrmStrict;
use Moose::Role;

has 'atcrontab' => ('is' => 'rw', 'isa' => 'VarChar255',        'coerce' => '1', 'required' => '1');
has 'message'   => ('is' => 'rw', 'isa' => 'VarChar512',        'coerce' => '1', 'required' => '1');
has 'periodic'  => ('is' => 'rw', 'isa' => 'enum_TeamRequired', 'coerce' => '1', 'required' => '1', 'default' => 'no');
has 'repeat'    => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '1', 'default' => '0');

1;
