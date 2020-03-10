package TMS::API::Core::SftLogEntryStrict;
use Moose::Role;

has 'Activity' => ('is' => 'rw', 'isa' => 'enum_Activity', 'coerce' => '1', 'required' => '1');

1;
