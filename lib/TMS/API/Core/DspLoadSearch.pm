package TMS::API::Core::DspLoadSearch;
use Moose::Role;

has 'BrokerId'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'CreatedBy' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'LoadRate'  => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');

1;
