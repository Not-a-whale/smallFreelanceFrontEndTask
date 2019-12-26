package TMS::API::Core::TskAlrmStrict;
use Moose::Role;

has 'atcrontab' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'message'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'tskid'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');

1;
