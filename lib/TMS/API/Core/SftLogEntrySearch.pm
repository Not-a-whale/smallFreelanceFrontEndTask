package TMS::API::Core::SftLogEntrySearch;
use Moose::Role;

has 'Activity' => ('is' => 'rw', 'isa' => 'enum_Activity', 'coerce' => '1', 'required' => '0');

1;
