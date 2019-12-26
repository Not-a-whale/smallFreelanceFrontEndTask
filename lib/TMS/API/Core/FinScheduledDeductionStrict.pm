package TMS::API::Core::FinScheduledDeductionStrict;
use Moose::Role;

has 'CreatedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'DateStart'      => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '1');
has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'ItemTemplateId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'PaymentAmount'  => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');

1;
