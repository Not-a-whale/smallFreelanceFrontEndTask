package TMS::API::Core::TskAlrmStrict;
use Moose::Role;

has 'atcrontab' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'message'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'periodic'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '1', 'default' => 'no');
has 'repeat'    => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '1', 'default' => '0');

1;
