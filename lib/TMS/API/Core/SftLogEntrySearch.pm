package TMS::API::Core::SftLogEntrySearch;
use Moose::Role;

has 'Activity'  => ('is' => 'rw', 'isa' => 'Any',         'required' => '0');
has 'DriverId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'LogbookId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
