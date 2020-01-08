package TMS::API::Core::FinScheduledDeductionSearch;
use Moose::Role;

has 'DateStart'        => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'PaymentAmount'    => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'CumulativeAmount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'Period'           => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');
has 'ScheduleType'     => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');
has 'Valid'            => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0');

1;
