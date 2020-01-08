package TMS::API::Core::SftLogEntryStrict;
use Moose::Role;

has 'Activity' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1');

1;
