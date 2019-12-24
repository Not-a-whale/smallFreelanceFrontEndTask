package TMS::API::Core::TskNtfiSearch;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'alrmid' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
