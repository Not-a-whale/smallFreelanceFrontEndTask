package TMS::API::Core::TskAlrmSearch;
use Moose::Role;

has 'atcrontab' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'message'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'tskid'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
