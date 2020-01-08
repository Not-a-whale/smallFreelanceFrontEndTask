package TMS::API::Core::TskAlrmSearch;
use Moose::Role;

has 'atcrontab' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'message'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'periodic'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'repeat'    => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');

1;
