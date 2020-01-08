package TMS::API::Core::SftLogEntrySearch;
use Moose::Role;

has 'Activity' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '0');

1;
