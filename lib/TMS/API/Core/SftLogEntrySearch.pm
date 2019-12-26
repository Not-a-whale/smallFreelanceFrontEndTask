package TMS::API::Core::SftLogEntrySearch;
use Moose::Role;

has 'Activity'  => ('is' => 'rw', 'isa' => 'Any',         'coerce' => '0', 'required' => '0');
has 'DriverId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'LogbookId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
