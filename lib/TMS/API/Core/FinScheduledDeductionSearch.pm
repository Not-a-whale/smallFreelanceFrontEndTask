package TMS::API::Core::FinScheduledDeductionSearch;
use Moose::Role;

has 'CreatedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'DateStart'      => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'ItemTemplateId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'PaymentAmount'  => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');

1;
