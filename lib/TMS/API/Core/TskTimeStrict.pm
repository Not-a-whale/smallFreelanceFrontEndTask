package TMS::API::Core::TskTimeStrict;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'actid'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
