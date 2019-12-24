package TMS::API::Core::FinScheduledDeductionStrict;
use Moose::Role;

has 'CreatedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'DateStart'      => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '1');
has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'ItemTemplateId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'PaymentAmount'  => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '1');

1;
