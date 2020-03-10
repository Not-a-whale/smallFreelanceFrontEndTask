package TMS::API::Core::FinScheduledDeductionStrict;
use Moose::Role;

has 'DateStart'        => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '1');
has 'PaymentAmount'    => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'CumulativeAmount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1', 'default' => '0.00');
has 'Period'           => ('is' => 'rw', 'isa' => 'enum_Period',   'coerce' => '1', 'required' => '0', 'default' => 'null');
has 'ScheduleType' =>
    ('is' => 'rw', 'isa' => 'enum_ScheduleType', 'coerce' => '1', 'required' => '1', 'default' => 'one-time charge');
has 'Valid' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '1');

1;
