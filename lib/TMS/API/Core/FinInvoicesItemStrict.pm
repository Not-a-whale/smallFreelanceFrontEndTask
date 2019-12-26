package TMS::API::Core::FinInvoicesItemStrict;
use Moose::Role;

has 'JobId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
