package TMS::API::Core::DspLoadSearch;
use Moose::Role;

has 'BrokerId'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'CreatedBy' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'LoadRate'  => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');

1;
