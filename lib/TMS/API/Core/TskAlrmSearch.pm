package TMS::API::Core::TskAlrmSearch;
use Moose::Role;

has 'atcrontab' => ('is' => 'rw', 'isa' => 'VarChar255',        'coerce' => '1', 'required' => '0');
has 'message'   => ('is' => 'rw', 'isa' => 'VarChar512',        'coerce' => '1', 'required' => '0');
has 'periodic'  => ('is' => 'rw', 'isa' => 'enum_TeamRequired', 'coerce' => '1', 'required' => '0');
has 'repeat'    => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');

1;
