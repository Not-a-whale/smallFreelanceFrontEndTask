package TMS::API::Core::TskTimeSearch;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'actid'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
