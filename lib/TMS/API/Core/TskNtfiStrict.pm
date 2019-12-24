package TMS::API::Core::TskNtfiStrict;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'alrmid' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
