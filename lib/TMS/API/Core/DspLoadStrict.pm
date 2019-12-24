package TMS::API::Core::DspLoadStrict;
use Moose::Role;

has 'BrokerId'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'CreatedBy' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'LoadRate'  => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '1');

1;
