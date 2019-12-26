package TMS::API::Core::SftLogEntryStrict;
use Moose::Role;

has 'Activity'  => ('is' => 'rw', 'isa' => 'Any',         'coerce' => '0', 'required' => '1');
has 'DriverId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'LogbookId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
