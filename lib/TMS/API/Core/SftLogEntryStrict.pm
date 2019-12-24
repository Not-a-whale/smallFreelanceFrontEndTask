package TMS::API::Core::SftLogEntryStrict;
use Moose::Role;

has 'Activity'  => ('is' => 'rw', 'isa' => 'Any',         'required' => '1');
has 'DriverId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'LogbookId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
