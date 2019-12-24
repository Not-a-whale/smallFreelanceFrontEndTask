package TMS::API::Core::TskAlrmStrict;
use Moose::Role;

has 'atcrontab' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'message'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'tskid'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
